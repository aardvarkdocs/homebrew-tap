class Aardvark < Formula
  desc "Mantine-powered static site generator: author in Markdown, build to HTML"
  homepage "https://github.com/aardvarkdocs/community"
  version "0.1.2"
  license :cannot_represent

  bottle do
    root_url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "2a672f7590ea6bf2c7e42e401aad7108f66e407b0491f980eb7154907a903fcd"
    sha256 cellar: :any_skip_relocation, ventura:       "139f20a0044df3312dc1f16c23843078c7b040da74b4f98813a09085386c9598"
  end

  on_macos do
    on_arm do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.2/aardvark-0.1.2-arm64.tar.gz"
      sha256 "fb566168c7442fa46281c6b06118bc9ecd4045b45ada902497a9c80d911cffb9"
    end
    on_intel do
      url "https://github.com/aardvarkdocs/homebrew-tap/releases/download/v0.1.2/aardvark-0.1.2-x86_64.tar.gz"
      sha256 "6670a1a9edfc00a4aba751b59c24f450c1353210aef1a72cf88cfe122ea637b9"
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
