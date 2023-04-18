class RexxwsRegina < Formula
  desc "Rexx interface to libwebsockets using Regina"
  homepage "https://rexxws.sourceforge.io"
  url "https://www.rexx.org/packages/rexxws-1.2.0.tar.gz"
  sha256 "70dd83a57fc0ddb5cd8dbfe9b1fb109f86630e87611838948a37be917ba44434"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends_on "libwebsockets"
  depends_on "regina-rexx"
  conflicts_with "rexxws-oorexx", because: "only one of the Regina or ooRexx version of rexxws can be active at the same time"

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
    assert_match "REXX-Regina", shell_output("#{bin}/rexxws -v")
  end
end
