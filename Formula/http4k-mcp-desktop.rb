class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://mcp.http4k.org"

  on_macos do
      url "https://github.com/http4k/mcp-desktop/releases/download/0.0.2/http4k-mcp-desktop.macos-arm64"
      sha256 "12f31a2e0c6c91dcbace19fc6275132b929fde83e8f2927b12433f4ed8c2b8e6"
  end

  def install
    mv "http4k-mcp-desktop.macos-x86_64", "http4k-mcp-desktop"
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end