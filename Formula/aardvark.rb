class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.1"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "bd95abdb608d95220342f26fe27f5d71ee483585ec4aac60a43d023abaf665ea"
    sha256 cellar: :any_skip_relocation, ventura:       "b0ef7bc6b60c1ccde6666b3368010f22ff1393ac60e9b960278c5021fad9726b"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.1/aardvark-0.1.1-arm64.tar.gz"
      sha256 "b19c5a2b41c733f7372d1bba26946452b8ccb53f17cbca5a069239f3d39ef365"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.1/aardvark-0.1.1-x86_64.tar.gz"
      sha256 "e167ffe946b6dbaab0c61eab14e09f4027502a63d1a15ceacd5f7a866d60be2a"
    end
  end

  def install
    bin.install "vark"
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
