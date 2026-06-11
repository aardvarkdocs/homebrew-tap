class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.5"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.5"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "2447c0dda60ec1230549f1d5c5b46748f75b9932206db7dd7b007d1b1214a100"
    sha256 cellar: :any_skip_relocation, ventura:       "2a7c20650d932312f9ac4d9a59c86dc8e7a26fbfd43799137334d9d94bab82d3"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.5/aardvark-0.1.5-arm64.tar.gz"
      sha256 "f4a7b08f4ad15ecfb90198d87a00469e675aa9f6fa1aa3029b6458ad9eaf5562"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.5/aardvark-0.1.5-x86_64.tar.gz"
      sha256 "7ad36a0a595485dcd19d12725e1864fb52114ae85ebd2cd62889b29b006252ce"
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
