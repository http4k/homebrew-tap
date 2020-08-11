class Http4k < Formula
  desc "Functional HTTP toolkit implemented in pure Kotlin"
  homepage "https://http4k.org"
  url "https://github.com/http4k/toolbox-cli/releases/download/v0.10.0/http4k-toolbox-0.10.0.zip"
  sha256 "e651551b60c646395dafe898c3e084071728bfb3fc1b253ec84969cf89333d0d"

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

