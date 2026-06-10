class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.4"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "384724da2e16b6df6180e67b5232165799a9aa1bc94ba559406405d4aaf07dfb"
    sha256 cellar: :any_skip_relocation, ventura:       "5d413709e76fe5f8406876f59a9f5a3cc857384a60ef73a28b7b2b0030fc54e9"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.4/aardvark-0.1.4-arm64.tar.gz"
      sha256 "e5038abdad5c3cab2d96f8b3eac0420e0ef1a5923c8e03b32d8114a998cf3e85"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.4/aardvark-0.1.4-x86_64.tar.gz"
      sha256 "94360a035e26dfc8b49102c001bf749504dedc1aa526d63005a9338727c77d70"
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
