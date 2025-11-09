class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://mcp.http4k.org"

  on_macos do
      url "https://github.com/http4k/mcp-desktop/releases/download/1.8.0/http4k-mcp-desktop.macos-arm64"
      sha256 "fbb5189e949aa7fda8d75e8ea625fae5547b36f7bbcb076e47ce9f0c30cb162d"
  end

  def install
    mv "http4k-mcp-desktop.macos-arm64", "http4k-mcp-desktop"
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end