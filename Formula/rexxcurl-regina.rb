class RexxcurlRegina < Formula
  desc "Rexx interface to curl using Regina"
  homepage "https://rexxcurl.sourceforge.io"
  url "https://www.rexx.org/packages/rexxcurl-2.1.0.tar.gz"
  sha256 "cace07043d9fa248c742e93ad9b7f7f4956b9bfd1d8593670b953fba236823ab"
  license "CPL-1.0"

  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "regina-rexx"
  conflicts_with "rexxcurl-oorexx", because: "only one of the Regina or ooRexx version of rexxcurl can be active at the same time"

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
    system "false"
  end
end
