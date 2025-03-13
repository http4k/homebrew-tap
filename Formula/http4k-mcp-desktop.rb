class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://http4k.org"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/http4k/mcp-desktop/releases/download/0.0.0/http4k-mcp-desktop-0.0.0.macos-arm64"
      sha256 "cad4f2cb295283ca0dad605609b92a1d04b13ac3c4cc8688d8efa6be0008cf8f"
    else
      url "https://github.com/http4k/mcp-desktop/releases/download/0.0.0/http4k-mcp-desktop-0.0.0.macos-x86_64"
      sha256 "aa8b35adde049a3199c853f61a1f8df5b93892f44591f279942ba8931df87e14"
    end
  end

  def install
    if Hardware::CPU.arm?
      mv "http4k-mcp-desktop-0.0.0-macos-arm64", "http4k-mcp-desktop"
    else
      mv "http4k-mcp-desktop-0.0.0-macos-x86_64", "http4k-mcp-desktop"
    end
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end