class RexxpdfRegina < Formula
  desc "Rexx interface to libharu using Regina"
  homepage "https://rexxpdf.sourceforge.io"
  url "https://www.rexx.org/packages/rexxpdf-1.0.1.tar.gz"
  sha256 "b0445dcf8d292bd1c28f94515f14fa26b0798e32960625bc697ea7e3ce7d51b5"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends_on "libharu"
  depends_on "regina-rexx"
  conflicts_with "rexxpdf-oorexx", because: "only one of the Regina or ooRexx version of rexxpdf can be active at the same time"

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
    assert_match "REXX-Regina", shell_output("#{bin}/rexxpdf -v")
  end
end
