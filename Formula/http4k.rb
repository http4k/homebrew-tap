class Http4k < Formula
  desc "Functional HTTP toolkit implemented in pure Kotlin"
  homepage "https://http4k.org"
  url "https://github.com/http4k/toolbox-cli/releases/download/v0.14.0/http4k-toolbox-0.14.0.zip"
  sha256 "5bbd0ed736e833ca6a1bedc2b2c4174c57c59edfd7eec67ca8930fc3cf585fa7"

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

