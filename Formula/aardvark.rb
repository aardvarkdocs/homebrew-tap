class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.9"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.9"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "f079eb61a07f77f6111ead9e88edd609ffe27ebc0df6eb6fa8fba9f3233b92f5"
    sha256 cellar: :any_skip_relocation, ventura:       "2093e0277b4ed1d235f61e59fc4320c4cec1bb1e6769d6bed2a0d5069e4c3a21"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.9/aardvark-0.1.9-arm64.tar.gz"
      sha256 "1e3073be2acf71952f69b718a9da4519252f5ea7e0adecf302af7550551ac4cc"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.9/aardvark-0.1.9-x86_64.tar.gz"
      sha256 "d9c5c855955b74a8f23ac17b730789e15e101fbd7b78894e8fa9bc4bdf5a9a60"
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
