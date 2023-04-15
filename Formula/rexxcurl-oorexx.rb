class RexxcurlOorexx < Formula
  desc "Rexx interface to curl using ooRexx"
  homepage "https://rexxcurl.sourceforge.io"
  url "https://www.rexx.org/packages/rexxcurl-2.1.0.tar.gz"
  sha256 "cace07043d9fa248c742e93ad9b7f7f4956b9bfd1d8593670b953fba236823ab"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "oorexx"
  conflicts_with "rexxcurl-regina", because: "only one of the Regina or ooRexx version of rexxcurl can be active at the same time"

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
    system "false"
  end
end
