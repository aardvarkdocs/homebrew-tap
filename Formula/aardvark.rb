class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.9"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.9"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "7af98872a54d04970760821f09c3d2330a98d6b58d3aebbacbcbe6b6f3e54429"
    sha256 cellar: :any_skip_relocation, ventura:       "8c373e262a20a58293f7eac2f53cd3bfb42339477b73a09b0c821ad903bf8611"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.9/aardvark-0.1.9-arm64.tar.gz"
      sha256 "d0ef81a23fba0e3c9c91c29a65081145e805459d36f5d16ae9a99ad2bdfb459a"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.9/aardvark-0.1.9-x86_64.tar.gz"
      sha256 "f7f84590e2b18a24c164feeaf85c91f94c85cd4ba51e5a1c4cba39f512b39c1c"
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
