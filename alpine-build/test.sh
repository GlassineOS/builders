#!/bin/sh
# Smoke test, runs inside the image.
set -eu
for t in gcc g++ make meson ninja pkg-config abuild patch curl mkfs.ext4 cpio xz zstd busybox.static magick; do
    command -v $t >/dev/null || { echo "missing: $t"; exit 1; }
done
pkg-config --exists x11 xext xdamage xfixes xi xcomposite egl libdrm wayland-server \
    wayland-protocols xkbcommon json-c libinput libevdev cairo pango gtk+-3.0 librsvg-2.0 \
    libxfce4panel-2.0 qrtr libzstd || { echo "missing pkg-config module"; exit 1; }
pkg-config --list-all | grep -q '^wlroots' || { echo "missing: wlroots"; exit 1; }
printf '#include <stdio.h>\nint main(void){puts("hi");return 0;}\n' > /tmp/t.c
gcc -static -Os -o /tmp/t /tmp/t.c && /tmp/t >/dev/null
id builder | grep -q abuild
echo "alpine-build ($(uname -m)): ok"
