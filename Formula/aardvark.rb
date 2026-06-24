class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://aardvarkdocs.com"
  version "0.2.0"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "c747661bd6f6f0ec2c8d7c4d5db36b079264399dfab59825b6e12c271cfea83f"
    sha256 cellar: :any_skip_relocation, ventura:       "90efc671fd3a72fb2d1198c7f816e3a5370ca8b11a2dc9a491ba58b6aa888822"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.2.0/aardvark-0.2.0-arm64.tar.gz"
      sha256 "96a0bfde5d06bea14d7cbfe37aade3d951b7c5d17e6ccf1cf7a66c5268fb09bf"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.2.0/aardvark-0.2.0-x86_64.tar.gz"
      sha256 "aaf139cd8fc159af3d8ed43fa79255c12b9c915412b273877c7bb63c610c1c7f"
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
