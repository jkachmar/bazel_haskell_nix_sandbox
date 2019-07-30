# Project name
workspace(name = "bazel_haskell_nix_sandbox")

# Load the repository rule to download an http archive
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Set `rules_haskell` version commit and SHA256 hash
rules_nixpkgs_version = "0.5.2"
rules_nixpkgs_sha256 = "5a384daa57b49abf9f0b672852f1a66a3c52aecf9d4d2ac64f6de0fd307690c8"

# Download `rules_nixpkgs`
http_archive(
    name = "io_tweag_rules_nixpkgs",
    strip_prefix = "rules_nixpkgs-%s" % rules_nixpkgs_version,
    urls = ["https://github.com/tweag/rules_nixpkgs/archive/v0.5.2.tar.gz"],
    sha256 = "5a384daa57b49abf9f0b672852f1a66a3c52aecf9d4d2ac64f6de0fd307690c8",
)

# Load nixpkgs at a given commit or tag
load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_git_repository")
nixpkgs_git_repository(
    name = "nixpkgs",
    revision = "f612ab79002c546d668c4f4ee3d5321fc814b838", # Any tag or commit hash
)

# Load the nixpkgs C toolchain with overrides
load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_cc_configure")
nixpkgs_cc_configure(
    nix_file = "//nix/nixpkgs:cc-toolchain.nix",
    repository = "//nix/nixpkgs:default.nix",
)

# Set `rules_haskell` version commit and SHA256 hash
rules_haskell_version = "de65a9f18379e5cdae3760fa66bb59800266754a"
rules_haskell_sha256 = "c3951e1497966249317af5962895e7d714c2f80ddd94b531f60a2bac0abffb60"

# Download `rules_haskell`
http_archive(
    name = "rules_haskell",
    strip_prefix = "rules_haskell-%s" % rules_haskell_version,
    urls = ["https://github.com/tweag/rules_haskell/archive/%s.tar.gz" % rules_haskell_version],
    sha256 = "%s" % rules_haskell_sha256,
)

# Misc. additionall rules_haskell Bazel dependencies
load("@rules_haskell//haskell:repositories.bzl", "rules_haskell_dependencies")
rules_haskell_dependencies()

# Register the GHC toolchain sourced from our snapshot
load("@rules_haskell//haskell:nixpkgs.bzl", "haskell_register_ghc_nixpkgs")
haskell_register_ghc_nixpkgs(
    attribute_path = "ghc", # The Nix attribute path to the compiler.
    repositories = {
        "nixpkgs": "//nix/nixpkgs:default.nix"
    },
    version = "8.6.5",
)

load("@rules_haskell//haskell:repositories.bzl", "rules_haskell_toolchains")
rules_haskell_toolchains()
