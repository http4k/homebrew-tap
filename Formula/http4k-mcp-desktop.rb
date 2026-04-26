class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://mcp.http4k.org"

  on_macos do
      url "https://github.com/http4k/mcp-desktop/releases/download/1.10.0/http4k-mcp-desktop.macos-arm64"
      sha256 "02c294cc9e16296d029c12041de6699f5edf8ed3bc5d29c88825e0f76c8c1b3f"
  end

  def install
    mv "http4k-mcp-desktop.macos-arm64", "http4k-mcp-desktop"
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end