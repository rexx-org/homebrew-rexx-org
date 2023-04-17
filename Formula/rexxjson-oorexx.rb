class RexxjsonOorexx < Formula
  desc "Rexx interface to  using ooRexx"
  homepage "https://rexxjson.sourceforge.io"
  url "https://www.rexx.org/packages/rexxjson-1.0.1.tar.gz"
  sha256 "04087cf1cbdd764f06edb8e9ba603951af1560ebd02acea2940451353dd419c5"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
#  depends_on "oorexx"
  conflicts_with "rexxjson-regina", because: "only one of the Regina or ooRexx version of rexxjson can be active at the same time"

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
    assert_match "REXX-ooRexx", shell_output("#{bin}/rexxjson -v")
  end
end
