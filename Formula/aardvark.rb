class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://aardvarkdocs.com"
  version "0.3.0"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "7ead3be5d86eb26982207e72a5a862081afc58392e694fa1aab327d7459165e4"
    sha256 cellar: :any_skip_relocation, ventura:       "1514f4a9eb629ef05928e5d5dd9cba7b103c29beb942e8e83bf49385cd3add6d"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.0/aardvark-0.3.0-arm64.tar.gz"
      sha256 "a9108047ab5d085c53ade694a5454bc6537525a00967f5cbfe630485022c9496"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.0/aardvark-0.3.0-x86_64.tar.gz"
      sha256 "bd5790825c8df780f38fde891a620354e7a260a59445f2a13ce03968af9c3965"
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
