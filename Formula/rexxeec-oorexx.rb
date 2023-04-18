class RexxeecOorexx < Formula
  desc "Rexx interface to  using ooRexx"
  homepage "https://rexxeec.sourceforge.io"
  url "https://www.rexx.org/packages/rexxeec-1.4.0.tar.gz"
  sha256 "a6102aae0109f372ae2471014418ff390e6a29130b75da24b24cd96a917b009d"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends_on "oorexx"
  conflicts_with "rexxeec-regina", because: "only one of the Regina or ooRexx version of rexxeec can be active at the same time"

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
    assert_match "REXX-ooRexx", shell_output("#{bin}/rexxeec -v")
  end
end
