class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://aardvarkdocs.com"
  version "0.3.1"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "6a2eb2a648e9ce703f866ca3de74b99ee94d645550febca79e24db1e001b4092"
    sha256 cellar: :any_skip_relocation, ventura:       "3c65046161ff14573a3cafeb676083aac0e2a9c850df118eac615adb2e2f6649"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.1/aardvark-0.3.1-arm64.tar.gz"
      sha256 "1f7e3f862c6a4da30bcdc9be13356c28d716430e8ac29062eca43f4f6c56463b"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.3.1/aardvark-0.3.1-x86_64.tar.gz"
      sha256 "ce0f63590607f3d09b7a34d136a2f0c50340288ba92e1f6a9af73351430e213b"
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
