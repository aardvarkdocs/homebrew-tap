class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://aardvarkdocs.com"
  version "0.4.1"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.4.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "89b6a3144f40b423210be3554089cb0e3cb5fd4a7d16ff246dce44371712691d"
    sha256 cellar: :any_skip_relocation, ventura:       "4e47dc6047f35fca4ab73bce9aa326c8f552765a03346e981455a9b2b57cbad5"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.4.1/aardvark-0.4.1-arm64.tar.gz"
      sha256 "cf571289b9a3c01116307393487270bda906921f3966cfd71d7286b97fded6a8"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.4.1/aardvark-0.4.1-x86_64.tar.gz"
      sha256 "645e7651888effaf909a140a6d661d49b012fcdb58687f89829977cf9a2a16a1"
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
