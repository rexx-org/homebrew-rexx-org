class RexxcsvOorexx < Formula
  desc "Rexx interface to libcsv using ooRexx"
  homepage "https://rexxcsv.sourceforge.io"
  url "https://www.rexx.org/packages/rexxcsv-1.0.1.tar.gz"
  sha256 "53db1e4db2ebb696d8ce53b0a55c43e045e0ed86db88af472554045d9c93898d"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends_on "libcsv"
  depends_on "oorexx"
  conflicts_with "rexxcsv-regina", because: "only one of the Regina or ooRexx version of rexxcsv can be active at the same time"

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
    assert_match "REXX-ooRexx", shell_output("#{bin}/rexxcsv -v")
  end
end
