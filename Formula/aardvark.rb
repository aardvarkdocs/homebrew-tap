class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.0"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "0ec6943f4a82e37a654d671f380fd1f5d6cf0fbdd4dbd2e5c0cdf5be553db44d"
    sha256 cellar: :any_skip_relocation, ventura:       "db3b3f410a756d37c84ba5e74f3de1164c2128ce80e62ffc8403a4ea6770e8e8"
  end

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
