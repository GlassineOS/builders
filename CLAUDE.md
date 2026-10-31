# CLAUDE.md — GlassineOS/builders

Builder images for GlassineOS (see `README.md`). Every change: extend `test.sh`, build
and test locally for every platform of the image before pushing:

    docker build --platform linux/arm64 -t t <image> && docker run --rm --platform linux/arm64 -v $PWD/<image>/test.sh:/t.sh:ro t sh /t.sh

- Nothing vendor-owned in an image or this repository: no firmware, blobs, dumps, keys.
- Images stay generic: no device names, no device-specific steps (those belong in the
  component or image repositories).
- Commits carry an `Assisted-by:` or `Co-Authored-By:` trailer. Never add
  `Signed-off-by`. Run `.glassine/org/scripts/safety-scan.sh --staged` before committing.
- Organization guidance for coding agents, including the project knowledge search
  (run `git submodule update --init` if the import below is missing):

@.glassine/org/AGENTS.md
