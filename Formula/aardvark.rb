class Aardvark < Formula
  desc "Static site generator for documentation: author in Markdown, build to HTML"
  homepage "https://aardvarkdocs.com"
  version "0.5.0"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "f959bc469b1d95d29e6ea54d037a667ed244944f89d3f743a3b2dcdd981ac902"
    sha256 cellar: :any_skip_relocation, ventura:       "c603498b2c1e8e2dc45b90933b26f65a2d42c8db3d682b1ee05485a1a63ede7f"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.5.0/aardvark-0.5.0-arm64.tar.gz"
      sha256 "da0a2c2877142ad0db57bf9d95d210b6c2f7d39a2c46ee7be37612e2564ea01b"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.5.0/aardvark-0.5.0-x86_64.tar.gz"
      sha256 "3f2fdf6f7f71ff7a0b8981be3428e13f2c1f6f0092f83e32454ac872f84f29d5"
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
