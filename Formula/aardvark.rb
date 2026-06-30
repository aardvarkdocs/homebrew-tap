class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://aardvarkdocs.com"
  version "0.2.1"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "3e927b143193c3ca2d22194a8535c23838a0c89c6af8aafec93dbbf7708e9dc7"
    sha256 cellar: :any_skip_relocation, ventura:       "7d25a4df364bc5ed32c262e470f4de87a167ebb815e0b4a607d26e411ecc0998"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.2.1/aardvark-0.2.1-arm64.tar.gz"
      sha256 "86d6ebd1c6f55d061ac755bb23345ced878588300fe549c2deaeee79810cb2e7"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.2.1/aardvark-0.2.1-x86_64.tar.gz"
      sha256 "7347989dce9b117c8641f8b4db162e8d051afa22991c7a83afe01de8b79b61a9"
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
