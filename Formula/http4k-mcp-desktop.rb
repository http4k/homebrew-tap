class Http4kMcpDesktop < Formula
  desc "Desktop client for http4k Management Control Plane"
  homepage "https://http4k.org"
  version "6.1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/http4k/mcp-desktop/releases/download/#{version}/http4k-mcp-desktop-#{version}-macos-arm64"
      sha256 "9e3cd5f4bac13adf2699947bfbd07312defc8c6b2390c6a68d6335f1bbd31695"
    else
      url "https://github.com/http4k/mcp-desktop/releases/download/#{version}/http4k-mcp-desktop-#{version}-macos-x86_64"
      sha256 "ea91c0b7b08181ff814ecfdefcc3f32896c4547163610c3a836b4bab8c35c9ea"
    end
  end

  def install
    if Hardware::CPU.arm?
      mv "http4k-mcp-desktop-macos-arm64", "http4k-mcp-desktop"
    else
      mv "http4k-mcp-desktop-macos-x86_64", "http4k-mcp-desktop"
    end
    bin.install "http4k-mcp-desktop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http4k-mcp-desktop --version")
  end
end