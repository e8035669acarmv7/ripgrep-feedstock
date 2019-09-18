#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

# build statically linked binary with Rust
cargo install --locked --features pcre2 --root "$PREFIX" --path .

# strip debug symbols
strip "$PREFIX/bin/rg"

# remove extra build file
rm -f "${PREFIX}/.crates.toml"
