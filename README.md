# Bazel Haskell Nix Sandbox

Trying to get a handle on Bazel, Haskell, and Nix

## Notes

Ensure that `.bazelrc.local` is set to select the Nixpkgs-based toolchain.

macOS:
`build --host_platform=@rules_haskell//haskell/platforms:darwin_x86_64_nixpkgs`

linux:
`build --host_platform=@rules_haskell//haskell/platforms:linux_x86_64_nixpkgs`
