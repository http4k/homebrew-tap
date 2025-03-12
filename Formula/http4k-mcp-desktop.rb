class Http4kMcpDesktop < Formula
  desc "Desktop client for http4k Management Control Plane"
  homepage "https://http4k.org"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/http4k/http4k-mcp-desktop/releases/download/v6.1.0.1/http4k-mcp-desktop-6.1.0.1.zip"
      sha256 "REPLACE_WITH_ARM_SHA256"
    else
      url "https://github.com/http4k/http4k-mcp-desktop/releases/download/v6.1.0.1/http4k-mcp-desktop-6.1.0.1.zip"
      sha256 "REPLACE_WITH_X86_SHA256"
    end
  end

  def install
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end