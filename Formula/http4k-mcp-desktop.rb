class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://mcp.http4k.org"

  on_macos do
      url "https://github.com/http4k/mcp-desktop/releases/download/0.0.3/http4k-mcp-desktop.macos-arm64"
      sha256 "d5a573bbd303de4fe082a1df780b91f6c2b9c6ff4559b3b77a9a121217ecbb85"
  end

  def install
    mv "http4k-mcp-desktop.macos-x86_64", "http4k-mcp-desktop"
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end