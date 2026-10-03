# SPDX-License-Identifier: GPL-2.0-or-later
# Cross toolchain for the mainline arm64 kernel, device trees and boot images (x86-64 host).
FROM debian:trixie-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
        gcc-aarch64-linux-gnu gcc make bc bison flex libssl-dev libelf-dev \
        device-tree-compiler cpio kmod python3 perl rsync xz-utils zstd git ca-certificates \
    && rm -rf /var/lib/apt/lists/*
ENV ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
