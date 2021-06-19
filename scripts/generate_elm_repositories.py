from __future__ import print_function

import argparse
import hashlib
import json
import multiprocessing.pool
import os.path
import shutil
import sys
import tempfile
import urllib.request


def read_dependencies(elm_json):
    metadata = json.load(elm_json)

    deps = {}
    if "direct" in metadata["dependencies"] or "indirect" in metadata["dependencies"]:
        deps.update(metadata["dependencies"].get("direct", {}))
        deps.update(metadata["dependencies"].get("indirect", {}))
    else:
        deps.update(metadata["dependencies"])
    if "direct" in metadata["test-dependencies"] or "indirect" in metadata["test-dependencies"]:
        deps.update(metadata["test-dependencies"].get("direct", {}))
        deps.update(metadata["test-dependencies"].get("indirect", {}))
    else:
        deps.update(metadata["test-dependencies"])

    return deps


def url_sha256(url):
    print("Fetching " + url, file=sys.stderr)
    with urllib.request.urlopen(url) as response:
        assert response.status >= 200 or response.status < 300, response.reason
        hasher = hashlib.sha256()
        for chunk in response:
            hasher.update(chunk)

        return hasher.hexdigest()


def elm_repository_data(name_version):
    (name, version) = name_version
    bazel_name = "elm_package_" + name.replace("/", "_").replace("-", "_")
    strip_prefix = os.path.basename(name) + "-" + version
    url = "https://github.com/{}/archive/{}.tar.gz".format(name, version)
    sha256 = url_sha256(url)
    return dict(
        bazel_name=bazel_name,
        strip_prefix=strip_prefix,
        url=url,
        sha256=sha256)


def print_elm_repositories(repos, file=sys.stdout):
    print("""\
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@com_github_edschouten_rules_elm//repository:def.bzl", "elm_repository")

def elm_repositories():""", file=file)

    if repos:
        for repo in sorted(repos, key=lambda r: r["bazel_name"]):
            print("""\
    maybe(
        elm_repository,
        name = "{bazel_name}",
        sha256 = "{sha256}",
        strip_prefix = "{strip_prefix}",
        urls = ["{url}"],
    )""".format(**repo), file=file)
    else:
        print("pass", file=file)


def main():
    workspace_dir = os.environ.get("BUILD_WORKSPACE_DIRECTORY")
    if workspace_dir:
        os.chdir(workspace_dir)

    parser = argparse.ArgumentParser(
        description='Generate elm_repository declarations from elm.json')
    parser.add_argument(
        'elm_json',
        metavar='elm.json',
        type=argparse.FileType('r'),
        default='elm.json',
        nargs='?',
        help='Path to the elm.json file')
    parser.add_argument(
        '--output',
        '-o',
        metavar='OUTPUT',
        type=str,
        default='-',
        help='Path to output file, or stdout.')
    parser.add_argument(
        '--jobs',
        '-j',
        metavar='NUM',
        type=int,
        default=None,
        help='Number of parallel jobs for fetching sources and calculating sha256 sums.')
    args = parser.parse_args()

    deps = read_dependencies(args.elm_json)
    with multiprocessing.pool.Pool(args.jobs) as pool:
        repos = pool.map(elm_repository_data, deps.items())
    if args.output != '-':
        with tempfile.TemporaryDirectory() as tmpdir:
            tmpfile = os.path.join(tmpdir, "out.bzl")
            with open(tmpfile, "w") as fd:
                print_elm_repositories(repos, file=fd)

            shutil.copyfile(tmpfile, args.output)
    else:
        print_elm_repositories(repos, file=sys.stdout)


if __name__ == "__main__":
    main()
