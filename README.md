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

From the repository root, run `bazel run //example:example_main` to run the project.

## Why?

### Why Nix?
Nix is a "purely functional" package management system, which might sound fancy to people who care about that sort of thing but I'm not one of them.

Nix is practically useful to me in this scenario because it improves upon three components of Haskell builds:
1) Caching
  - Nix provides "binary cache" functionality, which allows compiled artifacts to be uploaded and shared amongst users of a particular project
  - This is particularly useful for Haskell, given that compile times can really drag on collaborators of a project
2) musl libc
  - GHC doesn't make it particularly easy to build with musl libc at the moment, but the nixpkgs maintainers have put in a significant amount of effort to create package overlays that support musl libc
3) Static linking
  - musl libc enables static linking of Haskell executables, where glibc doesn't
  - Nix makes it easy to create package sets that override Haskell and C dependencies to use musl libc
  - the Nix cache can store and retrieve GHC compiled with `integer-simple` so that closed source Haskell applications can be statically linked and distributed without violating the LGPL

### Why Bazel?
Nix has _historically_ been a major pain to work with when it comes to Haskell builds, however the `bazel` build tool in conjunction with `rules_haskell` _may_ alleviate some of this pain by providing a nicer interface.

Plus, as more people use Bazel there are more mainstream tools that support its distributed builds and caching system.
