# aardvark Homebrew tap

Homebrew formula for **aardvark** — a Mantine-powered static site generator: author in
Markdown, build to a fast, fully static site.

## Install

```bash
brew tap aardvarkdocs/tap
brew install aardvark
```

The one-time `brew tap` registers this formula repository; after that `aardvark` behaves
like any other Homebrew package. Prefer a single command? Use:

```bash
brew install aardvarkdocs/tap/aardvark
```

This installs the **`vark`** command (`aardvark` also works, as an alias):

```bash
vark --version
vark --help
```

## Upgrade

```bash
brew update && brew upgrade aardvark
```

`vark update` also checks whether a newer release is available and tells you how to get it.

## Notes

- macOS only — a self-contained binary for Apple Silicon (arm64) and Intel (x86_64).
- The command is `vark`; `aardvark` is kept as an alias, so either name works. The Homebrew
  formula and package are still named `aardvark`.
- Interactive Mantine "islands" need Node.js at build time (`brew install node`); sites
  still build without it via `vark build --no-bundle`.

## How this tap is updated

This repository is **generated**. `Formula/aardvark.rb` and the per-architecture binaries it
points at (attached to this repo's GitHub Releases) are produced by the aardvark source
project's release tooling and pushed here — don't hand-edit the formula; it's overwritten on
every release.

### Cutting a release (maintainers)

A release builds the macOS arm64 + x86_64 binaries, packages them as Homebrew bottles plus
source tarballs, and publishes them here (a GitHub Release on this repo) alongside an updated
`Formula/aardvark.rb`. Two equivalent paths:

**From a GitHub Release (recommended):**

1. In the source project, bump the version and push it.
2. Cut a GitHub Release tagged `vX.Y.Z` there.
3. CI builds both architectures and publishes the assets + updated formula to this tap.

**Manually:** run the source project's `scripts/release.sh --publish`, which performs the
same build-and-publish from a local checkout (useful for inspecting artifacts first, or when
CI isn't available).

Users then upgrade with `brew update && brew upgrade aardvark`. Bottles are tagged at the
oldest supported macOS, and Homebrew's tag fallback lets newer macOS pour the same bottle —
so one pair of bottles (arm64 + Intel) covers the whole supported range.
