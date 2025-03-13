class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://http4k.org"

  on_macos do
      url "https://github.com/http4k/mcp-desktop/releases/download/0.0.1/http4k-mcp-desktop-0.0.1.macos-arm64"
      sha256 "fcec9d84f16ca08baec9d237434d8e5330a1ddf32f3b53745aa0eac88b60454e"
  end

  def install
    mv "http4k-mcp-desktop-0.0.1.macos-x86_64", "http4k-mcp-desktop"
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end