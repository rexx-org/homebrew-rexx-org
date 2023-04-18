class RexxwsOorexx < Formula
  desc "Rexx interface to libwebsockets using ooRexx"
  homepage "https://rexxws.sourceforge.io"
  url "https://www.rexx.org/packages/rexxws-1.2.0.tar.gz"
  sha256 "70dd83a57fc0ddb5cd8dbfe9b1fb109f86630e87611838948a37be917ba44434"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends_on "libwebsockets"
  depends_on "oorexx"
  conflicts_with "rexxws-regina", because: "only one of the Regina or ooRexx version of rexxws can be active at the same time"

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
    assert_match "REXX-ooRexx", shell_output("#{bin}/rexxws -v")
  end
end
