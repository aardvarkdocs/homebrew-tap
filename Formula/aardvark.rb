class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.7"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.7"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "c32ea8e90340aaf5706f1607ae80981656726e0ea3d1f91fc3307f9c2a69713e"
    sha256 cellar: :any_skip_relocation, ventura:       "a1a90237f2ee7a64a10b0c9334133432b564afd34ac84fd39fd17474c61be1be"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.7/aardvark-0.1.7-arm64.tar.gz"
      sha256 "5a637c6821c6795d93d6dd886ea0f7b2b2714ec5975bb7e72bf36d528a2fcef1"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.7/aardvark-0.1.7-x86_64.tar.gz"
      sha256 "310c401c36188fbdfdd4268f33c7ce96d510e8fa436607ebb44acd1acf763416"
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
