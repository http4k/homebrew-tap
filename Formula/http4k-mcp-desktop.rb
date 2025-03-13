class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://http4k.org"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/http4k/mcp-desktop/releases/download/#{version}/http4k-mcp-desktop-#{version}-macos-arm64"
      sha256 "b2d46da73e4793442ecf78ccf58143a635b878d1d37330de20f12d6a81c9a9bd"
    else
      url "https://github.com/http4k/mcp-desktop/releases/download/#{version}/http4k-mcp-desktop-#{version}-macos-x86_64"
      sha256 "aa8b35adde049a3199c853f61a1f8df5b93892f44591f279942ba8931df87e14"
    end
  end

  def install
    if Hardware::CPU.arm?
      mv "http4k-mcp-desktop-#{version}-macos-arm64", "http4k-mcp-desktop"
    else
      mv "http4k-mcp-desktop-#{version}-macos-x86_64", "http4k-mcp-desktop"
    end
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end