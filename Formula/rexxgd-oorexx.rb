class RexxgdOorexx < Formula
  desc "Rexx interface to gd using ooRexx"
  homepage "https://rexxgd.sourceforge.io"
  url "https://www.rexx.org/packages/rexxgd-2.2.0.tar.gz"
  sha256 "3be2bed28afd9ec2ade85cc0a9f747a05cdbfdc56e85b35b41468842fa7d1c51"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends on "gd"
#  depends_on "oorexx"
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
