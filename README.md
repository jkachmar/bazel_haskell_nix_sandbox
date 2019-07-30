# Bazel Haskell Nix Sandbox

Trying to get a handle on Bazel, Haskell, and Nix

## Setup

Install the [Nix package manager](https://nixos.org/nix/download.html).

Install [direnv](https://github.com/direnv/direnv#install).

Clone this repository and `cd` into the directory.

Run `nix-shell --pure --command 'ls'` to trigger Nix into setting up the build environment.

Ensure that `.bazelrc.local` is set to select the Nixpkgs-based toolchain...

On macOS:
```
build --host_platform=@rules_haskell//haskell/platforms:darwin_x86_64_nixpkgs
run --host_platform=@rules_haskell//haskell/platforms:darwin_x86_64_nixpkgs
```

On Linux:
```
build --host_platform=@rules_haskell//haskell/platforms:linux_x86_64_nixpkgs
run --host_platform=@rules_haskell//haskell/platforms:linux_x86_64_nixpkgs
```

Run `direnv allow` to allow `direnv` to autoload the repository's `.envrc`.

## Building and Running

From the repository root, run `bazel build //...` to build the project.

From the repository root, run `bazel run //:example` to run the project.

