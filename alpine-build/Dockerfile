# SPDX-License-Identifier: GPL-2.0-or-later
# Alpine build environment: compiles GlassineOS components, builds APKs (abuild) and
# assembles images. Built for linux/arm64 (the devices) and linux/amd64 (CI, tests).
ARG ALPINE=3.24
FROM alpine:${ALPINE}
# toolchain, packaging and image assembly
RUN apk add --no-cache alpine-sdk abuild-rootbld meson ninja pkgconf linux-headers patch curl \
        python3 python3-dev e2fsprogs cpio xz zstd busybox-static busybox-extras \
        imagemagick font-dejavu bluez-btmgmt
# libraries of the e-ink stack: X11 side, Wayland/sway side, shell
RUN apk add --no-cache \
        libx11-dev libxext-dev libxres-dev libxtst-dev libxdamage-dev libxfixes-dev libxi-dev \
        libxcomposite-dev mesa-dev libdrm-dev \
        wayland-dev wayland-protocols wlroots-dev libxkbcommon-dev json-c-dev libinput-dev \
        libevdev-dev eudev-dev linux-pam-dev pcre2-dev basu-dev cairo-dev pango-dev \
        gdk-pixbuf-dev librsvg-dev glib-dev gtk+3.0-dev xfce4-panel-dev \
        qrtr-dev zstd-dev
# abuild runs as an unprivileged user; scripts that need root keep running as root
RUN adduser -D builder && addgroup builder abuild
