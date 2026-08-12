class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://aardvarkdocs.com"
  version "0.3.2"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "f9ee5a9d3f9de3b0bff9e2d62d06973b6ab93f4609fd9353499d85f25117f563"
    sha256 cellar: :any_skip_relocation, ventura:       "ca04e8ce8f295790d41132d66c4a97a5f081058533c551dd2e925d510a7a7d28"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.2/aardvark-0.3.2-arm64.tar.gz"
      sha256 "18e5c8b41a91a015cd5ea18d78aec9bfa95a1bcb8b80aee1f50dcf2d7f623ac3"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.2/aardvark-0.3.2-x86_64.tar.gz"
      sha256 "6568f5535026a7f35e69870bea72c014ae63e73497300f28c2305b4fe36435f7"
    end
  end

  def install
    bin.install "vark"
    bin.install_symlink "vark" => "aardvark"  # aardvark works as an alias (source-build path)
  end

  def caveats
    <<~CAVEATS
      Interactive Mantine "islands" need Node.js at build time:
        brew install node
      Sites still build without it:  vark build --no-bundle
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vark --version")
  end
end
