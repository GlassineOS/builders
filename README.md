# GlassineOS/builders

Container images that build GlassineOS. Local builds and CI use the same images, so a
build that works on a laptop works in CI and the other way round.

This repository holds toolchain images only. What a GlassineOS system contains, and how
its images are built, is defined in [GlassineOS/images](https://github.com/GlassineOS/images).

| Image | Base | Platforms | Builds |
|---|---|---|---|
| `ghcr.io/glassineos/kernel-build` | Debian trixie | amd64 | the mainline kernel, device trees, boot images (cross-compiled) |
| `ghcr.io/glassineos/alpine-build` | Alpine 3.24 | arm64, amd64 | GlassineOS programs, APK packages (`abuild`) |

`alpine-build` carries the libraries of the e-ink stack (X11, Wayland/wlroots, GTK) so
component builds don't install packages on every run. arm64 runs natively on an arm64
host and through QEMU elsewhere (`docker run --platform linux/arm64`).

## Tags

| Tag | Meaning |
|---|---|
| `3.24`, `trixie` | moving: the latest build for that base |
| `3.24-YYYYMMDD`, `trixie-YYYYMMDD` | frozen: one weekly or on-change build |
| `sha-<commit>` | the build of one commit of this repository |

Development uses the moving tag. Release builds pin a dated tag or a digest and record
it in the release manifest. The images are rebuilt every Monday to pick up security
updates.

## Pulling

```sh
docker pull ghcr.io/glassineos/alpine-build:3.24
```

While this repository is private, the packages are too: log in first with a token that
has `read:packages` (`gh auth refresh -s read:packages`, then
`gh auth token | docker login ghcr.io -u <user> --password-stdin`).

## Changing an image

Edit the `Dockerfile`, extend the image's `test.sh` so the new tool or library is
checked, and open a pull request: CI builds and tests every platform without
publishing. Merging publishes. Nothing vendor-owned goes into an image (firmware,
proprietary blobs, device dumps); the safety scan checks this repository.

Not here, on purpose: builders for the stock-kernel era (vendor bootloader, the old
recovery), which stay outside GlassineOS, and the recovery builder, which comes with the
mainline recovery.

## License

GPL-2.0-or-later (`LICENSE`). The images contain third-party software under its own
licenses.
