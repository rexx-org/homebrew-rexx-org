class RexxcurlRegina < Formula
  desc "Rexx interface to curl using Regina"
  homepage "https://rexxcurl.sourceforge.io"
  url "https://www.rexx.org/packages/rexxcurl-2.1.1.tar.gz"
  sha256 "2de96230048738298fc042cdb149b21c0dba52aab6f311fdc64c8eeee5cc8605"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "regina-rexx"
  conflicts_with "rexxcurl-oorexx", because: "only one of the Regina or ooRexx version of rexxcurl can be active at the same time"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-arch=none",
           "--with-brew-addon-dir=#{lib}/regina-rexx/addons"
    system "make"
    system "make", "installtools", "installaddons", "installaddonslink", "installdoc"
  end

  test do
    assert_match "REXX-Regina", shell_output("#{bin}/rexxcurl -v")
  end
end
