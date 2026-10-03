#!/bin/sh
# Smoke test, runs inside the image.
set -eu
for t in aarch64-linux-gnu-gcc make bc bison flex dtc cpio depmod python3 perl rsync xz zstd git; do
    command -v $t >/dev/null || { echo "missing: $t"; exit 1; }
done
printf 'int f(void){return 1;}\n' > /tmp/t.c && aarch64-linux-gnu-gcc -c -o /tmp/t.o /tmp/t.c
echo kernel-build: ok
