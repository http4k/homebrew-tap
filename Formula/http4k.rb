class Http4k < Formula
  desc "Functional HTTP toolkit implemented in pure Kotlin"
  homepage "https://http4k.org"
  url "https://github.com/http4k/toolbox-cli/releases/download/v0.15.0/http4k-toolbox-0.15.0.zip"
  sha256 "2a98a742c55f3309c930102cebe1388d18e4537813ff385914d05d837e39ee1f"

  bottle :unneeded

  depends_on "openjdk"

  def install
    rm Dir["bin/*.bat"]
    chmod 0755, "bin/http4k"

    libexec.install Dir["*"]
    bin.install Dir["#{libexec}/bin/*"]
    bin.env_script_all_files libexec/"bin", JAVA_HOME: Formula["openjdk"].opt_prefix
  end

  test do
    assert_match /http4k CLI.*/, shell_output("#{bin}/http4k --version")
  end
end