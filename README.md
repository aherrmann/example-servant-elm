# ZuriHac 2021 - Building Haskell with Bazel

Workshop on porting a Haskell and Elm project to be built with Bazel.

- [Slides](./slides/zurihac_2021.pdf)
- [Recording](https://youtu.be/GV5MG05rWO0)
- [Completed build](https://github.com/aherrmann/example-servant-elm/tree/solution)

## Setup

The project contains a [`Dockerfile`](docker/Dockerfile) that installs all
required dependencies. Use as follows:

1. Build the Docker image
    ```
    $ docker build -t zurihac2021 docker
    ```
2. Start a Docker container as a daemon
    ```
    $ docker run -d -v "$PWD:/work" --network host -it zurihac2021
    cbc8a033b90dec3df4b470b157903fc23cc4c1a956a1370c8c6ca55b9aa63ef2
    ```
3. Open a shell session in the Docker container (can be executed multiple times)
    ```
    $ docker exec -it -w /work --detach-keys="ctrl-@" cbc8a033b90d bash
    ```

You can query for the Docker container's id using
```
$ docker ps
CONTAINER ID   IMAGE         COMMAND   ...
cbc8a033b90d   zurihac2021   "bash"    ...
```

You can then stop that container using
```
$ docker stop cbc8a033b90d
```

## Generate Elm Repositories

To generate an `elm_repository` for each dependency in `client/elm.json` use
```
$ bazel run //scripts:generate_elm_repositories -- client/elm.json -o elm_repositories.bzl
```

## Build and Test

To build a particular target or all targets
```
$ bazel build //server/src:server
$ bazel build //...
```

To run a particular test or all tests
```
$ bazel test //server/test:spec
$ bazel test //...
```

## Run the Server

To run the Haskell server
```
$ bazel run //server/src:server
listening on port 3000...
```

Then browse to http://localhost:3000.

## Interactive Development

You can use [`bazel-watcher`][bazel-watcher] to continuously rebuild the
assets whenever any of its sources change, like so.

```
$ ibazel build //assets
```

You can use [`ghcid`][ghcid] to continuously reload the backend whenever
any of its sources change, like so.

```
$ bazel build @stackage-exe//ghcid
$ ASSETS_DIR=bazel-bin/assets \
    ghcid --command="bazel run //server/src:serve@ghci" \
      --test=Main.main \
      --reload=bazel-bin/assets
```

This will load the Haskell code into a GHCi session and run the server in
the interpreter. It will reload the session and restart the server
whenever any of the Haskell source files or the assets change.

Note, if the dependency graph changes, e.g. when you edit a `BUILD.bazel`
file, then you will have to restart `ghcid` itself.

[bazel-watcher]: https://github.com/bazelbuild/bazel-watcher#readme
[ghcid]: https://github.com/ndmitchell/ghcid#readme

## Haskell Servant and Elm Example

Based on [`haskell-servant/example-servant-elm`](https://github.com/haskell-servant/example-servant-elm.git).

This example project illustrates how to set up a project that:

- Uses haskell and `servant` as a backend exposing a JSON api
  (and serving some files).
- Uses elm to write the frontend.
- Uses `servant-elm` to generate client functions in elm for the JSON api.
  This means that mismatches regarding the JSON api will be detected statically.
- Allows a very fast development cycle: You can type-check the server and
  client code in a very short amount of time.

### More examples

This repository demonstrates a servant backend and an elm frontend. More code generation examples can be found in [`haskell-servant/servant-elm`](https://github.com/haskell-servant/servant-elm/tree/master/examples).
