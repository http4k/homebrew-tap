class Http4k < Formula
  desc "Functional HTTP toolkit implemented in pure Kotlin"
  homepage "https://http4k.org"
  url "https://github.com/http4k/toolbox-cli/releases/download/v0.8.0/http4k-toolbox-0.8.0.zip"
  sha256 "7a7ef7217ef9e59d378904a094347e40c1240fb08579ee4939609794ee7bfb79"

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

