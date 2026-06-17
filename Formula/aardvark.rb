class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.8"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.8"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "83cd82ebb7ff8fc21f9c4b50ef2794cb8902a78144d2d9802c7a1ddf78ca2e88"
    sha256 cellar: :any_skip_relocation, ventura:       "548c46b95945fbe0e3b9880eaf8a72a6aa3502a3cfdc06c2e6ff13fdf6053816"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.8/aardvark-0.1.8-arm64.tar.gz"
      sha256 "e865159640aff4249b42f5fd2b5585a9c2a6ec4ba268ea8d9d01acb11610e417"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.8/aardvark-0.1.8-x86_64.tar.gz"
      sha256 "fd043740c783a59e339e9102cd5a8e452fcc4aed32bc185ceef4bf7a70fa681b"
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
