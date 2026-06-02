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

Then:

```bash
aardvark --version
aardvark --help
```

## Upgrade

```bash
brew update && brew upgrade aardvark
```

## Notes

- macOS only — a self-contained binary for Apple Silicon (arm64) and Intel (x86_64).
- Interactive Mantine "islands" need Node.js at build time (`brew install node`); sites
  still build without it via `aardvark build --no-bundle`.
