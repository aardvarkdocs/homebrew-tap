class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.5"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.5"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "b4b88e42e5780aec5c4d32e0e31fb3695d2534aea130dd461375283393b7ef68"
    sha256 cellar: :any_skip_relocation, ventura:       "f677f328113a53019b3f2dadb75829d9ecd3d2e6e5cf198972dab79a67579780"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.5/aardvark-0.1.5-arm64.tar.gz"
      sha256 "e27ca3204988199052781495319ab6330126b69184982f7bb713604b9a8cfca5"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.5/aardvark-0.1.5-x86_64.tar.gz"
      sha256 "6c3529958729b3867cd4820f0cef34085d04666f873b9bbe3269bf3b3574d07b"
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
