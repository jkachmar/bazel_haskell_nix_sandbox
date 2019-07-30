# Give your project a name. :)
workspace(name = "YOUR_PROJECT_NAME_HERE")

# Load the repository rule to download an http archive
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Download rules_haskell and make it accessible
rules_haskell_version = "de65a9f18379e5cdae3760fa66bb59800266754a"
rules_haskell_sha256 = "c3951e1497966249317af5962895e7d714c2f80ddd94b531f60a2bac0abffb60"

http_archive(
    name = "rules_haskell",
    strip_prefix = "rules_haskell-%s" % rules_haskell_version,
    urls = ["https://github.com/tweag/rules_haskell/archive/%s.tar.gz" % rules_haskell_version],
    sha256 = "%s" % rules_haskell_sha256,
)

load(
    "@rules_haskell//haskell:repositories.bzl",
    "rules_haskell_dependencies",
)

# Setup all Bazel dependencies required by `rules_haskell`
rules_haskell_dependencies()

load(
    "@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl",
    "nixpkgs_git_repository",
)

nixpkgs_git_repository(
    name = "nixpkgs",
    revision = "f612ab79002c546d668c4f4ee3d5321fc814b838", # Any tag or commit hash
)

load(
    "@rules_haskell//haskell:nixpkgs.bzl",
    "haskell_register_ghc_nixpkgs",
)

haskell_register_ghc_nixpkgs(
    version = "8.6.5", # Any GHC version
    attribute_path = "ghc", # The Nix attribute path to the compiler.
    repositories = {"nixpkgs": "@nixpkgs"},
)

load(
    "@rules_haskell//haskell:repositories.bzl",
    "rules_haskell_toolchains",
)

rules_haskell_toolchains()
