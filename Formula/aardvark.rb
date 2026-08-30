class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://aardvarkdocs.com"
  version "0.4.0"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "21b7fc1a0f3a5b8c315aebbc8bf3b62d13e6695dc88c0d3c4eea19c6b033934a"
    sha256 cellar: :any_skip_relocation, ventura:       "f740edcb60785f0024ea174d62154d4f29ecebf7454823306c5afeb1596462f9"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.4.0/aardvark-0.4.0-arm64.tar.gz"
      sha256 "0f49bc1e11e30d8d2b8b2436659a50bab2cffba6fd28f8eb509e1830096cc097"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.4.0/aardvark-0.4.0-x86_64.tar.gz"
      sha256 "4ac792c4b510ca28e013671d82b67dbac910b5634db476df445799ec88e3739d"
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
