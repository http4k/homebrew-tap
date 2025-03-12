class Http4kMcpDesktop < Formula
  desc "Desktop client for http4k Management Control Plane"
  homepage "https://http4k.org"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/http4k/http4k-mcp-desktop/releases/download/v6.1.0.1/http4k-mcp-desktop-macos-x86_64"
      sha256 "REPLACE_WITH_ARM_SHA256"
    else
      url "https://github.com/http4k/http4k-mcp-desktop/releases/download/v6.1.0.1/http4k-mcp-desktop-macos-arm64"
      sha256 "REPLACE_WITH_X86_SHA256"
    end
  end

  def install
    if Hardware::CPU.arm?
      mv "http4k-mcp-desktop-macos-arm64", "http4k-mcp-desktop"
    else
      mv "http4k-mcp-desktop-macos-x86_64", "http4k-mcp-desktop"
    end
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end