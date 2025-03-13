class Http4kMcpDesktop < Formula
  desc "http4k MCP Desktop - multi-protocol MCP client application"
  homepage "https://http4k.org"
  version "0.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/http4k/mcp-desktop/releases/download/#{version}/http4k-mcp-desktop-#{version}-macos-arm64"
      sha256 "49cd1e803be62fe3a4165d175ef2c568f8a9271a4da8e286ef3a5bba3c258f91"
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