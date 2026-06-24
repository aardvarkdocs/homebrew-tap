class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://aardvarkdocs.com"
  version "0.2.0"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "ebd90817561dddd99a0efd6efd74cfcb20ba14582d895c5ecb3d4e1a86d5e8cb"
    sha256 cellar: :any_skip_relocation, ventura:       "066b1e4edb0fa8b34e266dd52c194a0eec3a0e6a3334a305db74357b66e09981"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.2.0/aardvark-0.2.0-arm64.tar.gz"
      sha256 "9923fe77b748f5035f988276e6759abbb1fc6e627eb21d77dee51decb9a7dfb0"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.2.0/aardvark-0.2.0-x86_64.tar.gz"
      sha256 "e0c61540d32325fe35b06c30976ef27b7437f846341f2fda0634574feb535a98"
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
