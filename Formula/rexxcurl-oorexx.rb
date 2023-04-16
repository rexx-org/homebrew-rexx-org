class RexxcurlOorexx < Formula
  desc "Rexx interface to curl using ooRexx"
  homepage "https://rexxcurl.sourceforge.io"
  url "https://www.rexx.org/packages/rexxcurl-2.1.0.tar.gz"
  sha256 "ce528f66b54a287634242e287ca73f6c033461eea818b81bd80bdd9239a2476e"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "oorexx"
  conflicts_with "rexxcurl-regina", because: "only one of the Regina or ooRexx version of rexxcurl can be active at the same time"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=oorexx",
           "--with-arch=none"
    system "make"
    system "make", "installtools", "installaddons", "installaddonslink", "installdoc"
  end

  test do
    assert_match "REXX-ooRexx", shell_output("#{bin}/rexxcurl -v")
  end
end
