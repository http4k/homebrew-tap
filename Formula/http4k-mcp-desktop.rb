class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://http4k.org"
  version "0.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/http4k/mcp-desktop/releases/download/#{version}/http4k-mcp-desktop-#{version}.macos-arm64"
      sha256 "fcec9d84f16ca08baec9d237434d8e5330a1ddf32f3b53745aa0eac88b60454e"
    else
      url "https://github.com/http4k/mcp-desktop/releases/download/#{version}/http4k-mcp-desktop-#{version}.macos-x86_64"
      sha256 "aa8b35adde049a3199c853f61a1f8df5b93892f44591f279942ba8931df87e14"
    end
  end

  def install
    if Hardware::CPU.arm?
      mv "http4k-mcp-desktop-#{version}.macos-arm64", "http4k-mcp-desktop"
    else
      mv "http4k-mcp-desktop-#{version}.macos-x86_64", "http4k-mcp-desktop"
    end
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end