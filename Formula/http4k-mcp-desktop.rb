class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://mcp.http4k.org"

  on_macos do
      url "https://github.com/http4k/mcp-desktop/releases/download/1.3.0/http4k-mcp-desktop.macos-arm64"
      sha256 "c4d08db81682b4f0251971c79713b1c705405c3cfd997e072bda3c0ec3401df9"
  end

  def install
    mv "http4k-mcp-desktop.macos-arm64", "http4k-mcp-desktop"
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end