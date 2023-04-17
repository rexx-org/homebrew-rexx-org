class RexxgdOorexx < Formula
  desc "Rexx interface to gd using ooRexx"
  homepage "https://rexxgd.sourceforge.io"
  url "https://www.rexx.org/packages/rexxgd-2.2.0.tar.gz"
  sha256 "2419440bea1a103644b7bc291074e45f6d732ba9afaba3cf67af058d1a8e3a36"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends_on "gd"
  depends_on "oorexx"
  conflicts_with "rexxgd-regina", because: "only one of the Regina or ooRexx version of rexxgd can be active at the same time"

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
    assert_match "REXX-ooRexx", shell_output("#{bin}/rexxgd -v")
  end
end
