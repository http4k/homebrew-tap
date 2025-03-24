class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://mcp.http4k.org"

  on_macos do
      url "https://github.com/http4k/mcp-desktop/releases/download/1.2.0/http4k-mcp-desktop.macos-arm64"
      sha256 "e55936f4929b6f7d7c7bed8ed197570dd7e33980e3e4d0b55dce25cdb8dcc9a4"
  end

  def install
    mv "http4k-mcp-desktop.macos-arm64", "http4k-mcp-desktop"
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end