#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# sudo apt install m4 make automake libtool texinfo autoconf

bash ./autogen.sh
bash ./configure --disable-shared --with-pic --host=loongarch64-linux-gnu
make

# Copy result to output directory
LWJGL_OUTPUT_DIR="${LWJGL_OUTPUT_DIR:-/tmp/lwjgl3-build/output}"

mkdir -p "$LWJGL_OUTPUT_DIR"
cp ./loongarch64-unknown-linux-gnu/.libs/libffi_convenience.a "$LWJGL_OUTPUT_DIR/libffi.a"
