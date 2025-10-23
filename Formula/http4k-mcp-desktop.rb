class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://mcp.http4k.org"

  on_macos do
      url "https://github.com/http4k/mcp-desktop/releases/download/1.7.0/http4k-mcp-desktop.macos-arm64"
      sha256 "ef2c4a1a668523297636579b89aca35f8ae89ec6a53edf2dd70e1db0fab12310"
  end

  def install
    mv "http4k-mcp-desktop.macos-arm64", "http4k-mcp-desktop"
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end