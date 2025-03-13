class Http4kMcpDesktop < Formula
  desc "Desktop client for http4k Management Control Plane"
  homepage "https://http4k.org"
  version "6.1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/http4k/mcp-desktop/releases/download/#{version}/http4k-mcp-desktop-#{version}-macos-arm64"
      sha256 "34dbb7d4540958e8a151c059419a70ab7c5f759a4e1a6397f768ee88bd05f501"
    else
      url "https://github.com/http4k/mcp-desktop/releases/download/#{version}/http4k-mcp-desktop-#{version}-macos-x86_64"
      sha256 "474be174f34ca3554f25455802e4c5c406d80409fcd36c568e38ef257a1973fa"
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