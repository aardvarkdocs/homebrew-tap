class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.0/aardvark-0.1.0-arm64.tar.gz"
      sha256 "edc57f093ad4036b88a555ef044bc2a6d9442b4ce5233bb023ab743b18ac5f4d"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.0/aardvark-0.1.0-x86_64.tar.gz"
      sha256 "e00b6aef9395761b9deb61221a11e0be211c37284a60833a0faf04b90f13c1fa"
    end
  end

  def install
    bin.install "aardvark"
  end

  def caveats
    <<~CAVEATS
      Interactive Mantine "islands" need Node.js at build time:
        brew install node
      Sites still build without it:  aardvark build --no-bundle
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aardvark --version")
  end
end
