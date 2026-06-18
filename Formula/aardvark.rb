class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.10"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.10"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "019225b247a8e85bc28d9409cb409ccacc6fd5a6ce6ee25a74273882ca02afc2"
    sha256 cellar: :any_skip_relocation, ventura:       "33728bf8aa4b652ca72f602b9d50352d12da7e2518024c4dde18450fa67e1599"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.10/aardvark-0.1.10-arm64.tar.gz"
      sha256 "1b9bbde0e457d90f123dbfb4e10fdaaabc62bfa34e4804b859ef0f1d727153bf"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.10/aardvark-0.1.10-x86_64.tar.gz"
      sha256 "b2eedf97497a674f2aecc4d75174f215693caf3037afb77f1c90ea015c2938bf"
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
