load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@com_github_edschouten_rules_elm//repository:def.bzl", "elm_repository")

def elm_repositories():
    maybe(
        elm_repository,
        name = "elm_package_NoRedInk_elm_json_decode_pipeline",
        sha256 = "d4c272a21626a02f8e782929e74def3ee04e1e0431741f1eed0287ee81ed4578",
        strip_prefix = "elm-json-decode-pipeline-1.0.0",
        urls = ["https://github.com/NoRedInk/elm-json-decode-pipeline/archive/1.0.0.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_bartavelle_json_helpers",
        sha256 = "d616cc7118b71ef17a2fade01a0612ceb0796743893aa8882432602b54c6264d",
        strip_prefix = "json-helpers-2.0.2",
        urls = ["https://github.com/bartavelle/json-helpers/archive/2.0.2.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_browser",
        sha256 = "23f41491d325afc72649d512741fb8173725014c93e482d25bab3325555a4f59",
        strip_prefix = "browser-1.0.2",
        urls = ["https://github.com/elm/browser/archive/1.0.2.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_bytes",
        sha256 = "922f3526e3b430e947d1d2eac5965e4caae625013649de2f657d4f258a5bdc0b",
        strip_prefix = "bytes-1.0.8",
        urls = ["https://github.com/elm/bytes/archive/1.0.8.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_core",
        sha256 = "6e37b11c88c89a68d19d0c7625f1ef39ed70c59e443def95e4de98d6748c80a7",
        strip_prefix = "core-1.0.5",
        urls = ["https://github.com/elm/core/archive/1.0.5.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_explorations_test",
        sha256 = "e614b82b04170d41935e3200a3fcbf740d889d6a75d85bf2480a9f2ad53a4dbb",
        strip_prefix = "test-1.2.2",
        urls = ["https://github.com/elm-explorations/test/archive/1.2.2.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_file",
        sha256 = "c85b4025e12c1bf2dee9e4d853459ead7d1fa917304adfa2af27d116c86292e6",
        strip_prefix = "file-1.0.5",
        urls = ["https://github.com/elm/file/archive/1.0.5.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_html",
        sha256 = "73b885e0a3d2f9781b1c9bbcc1ee9ac032f503f5ef46a27da3ba617cebbf6fd8",
        strip_prefix = "html-1.0.0",
        urls = ["https://github.com/elm/html/archive/1.0.0.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_http",
        sha256 = "619bc23d7753bc172016ea764233dd7dfded1d919263c41b59885c5bcdd10b01",
        strip_prefix = "http-2.0.0",
        urls = ["https://github.com/elm/http/archive/2.0.0.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_json",
        sha256 = "d0635f33137e4ad3fc323f96ba280e45dc41afa51076c53d9f04fd92c2cf5c4e",
        strip_prefix = "json-1.1.3",
        urls = ["https://github.com/elm/json/archive/1.1.3.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_random",
        sha256 = "b4b9dc99d5a064bc607684dd158199208bce51c0521b7e8a515c365e0a11168d",
        strip_prefix = "random-1.0.0",
        urls = ["https://github.com/elm/random/archive/1.0.0.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_time",
        sha256 = "e18bca487adec67bfe4043a33b975d81527a7732377050d0421dd86d503c906d",
        strip_prefix = "time-1.0.0",
        urls = ["https://github.com/elm/time/archive/1.0.0.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_url",
        sha256 = "840e9d45d8a9bd64a7f76421a1de2518e02c7cbea7ed42efd380b4e875e9682b",
        strip_prefix = "url-1.0.0",
        urls = ["https://github.com/elm/url/archive/1.0.0.tar.gz"],
    )
    maybe(
        elm_repository,
        name = "elm_package_elm_virtual_dom",
        sha256 = "cf87286ed5d1b31aaf99c6a3368ccd340d1356b1973f1afe5f668c47e22b3b60",
        strip_prefix = "virtual-dom-1.0.2",
        urls = ["https://github.com/elm/virtual-dom/archive/1.0.2.tar.gz"],
    )
