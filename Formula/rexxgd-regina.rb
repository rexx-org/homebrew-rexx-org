class RexxgdRegina < Formula
  desc "Rexx interface to gd using Regina"
  homepage "https://rexxgd.sourceforge.io"
  url "https://www.rexx.org/packages/rexxgd-2.2.0.tar.gz"
  sha256 "aa0532fff1815c646ffdd51c4c57fbfca6d98b5f0f2386d73125e0efc7611715"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends_on "gd"
  depends_on "regina-rexx"
  conflicts_with "rexxgd-oorexx", because: "only one of the Regina or ooRexx version of rexxgd can be active at the same time"

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
    assert_match "REXX-Regina", shell_output("#{bin}/rexxgd -v")
  end
end
