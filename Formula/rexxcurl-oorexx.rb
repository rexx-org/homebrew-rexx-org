class RexxcurlOorexx < Formula
  desc "Rexx interface to curl using ooRexx"
  homepage "https://rexxcurl.sourceforge.io"
  url "https://www.rexx.org/packages/rexxcurl-2.1.1.tar.gz"
  sha256 "2de96230048738298fc042cdb149b21c0dba52aab6f311fdc64c8eeee5cc8605"
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
