class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://aardvarkdocs.com"
  version "0.3.3"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.3"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "e8ea1a9e1337011a367ff69c5a85d3b93b9b679500d31082a8615c09b5045f5b"
    sha256 cellar: :any_skip_relocation, ventura:       "30bd0c984eb613c1d6649c2c31423edd47c874bc9344ba2922a7eb3849c5a907"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.3/aardvark-0.3.3-arm64.tar.gz"
      sha256 "6dcae04376104a862de12e9338f0ce31fbc0480eeaa3629a5dede38a333a125d"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.3/aardvark-0.3.3-x86_64.tar.gz"
      sha256 "a8ef5c8967ce0a1400a548445184d10427fa51ffcf9727fdb2fedd25a6bbecfd"
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
