class Rexxpdf < Formula
  desc "Rexx interface to libwebsockets"
  homepage "https://rexxpdf.sourceforge.io"
  url "https://www.rexx.org/packages/rexxpdf-1.0.1.tar.gz"
  sha256 "aa0d57750c9fe30837d8fc6acfe2044461f4520ebc4d18f476b1a29b7ad5958b"
  license "GPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "libharu"
  depends_on "regina-rexx"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-arch=none",
           "--with-brew-addon-dir=#{lib}/regina-rexx/addons"
    system "make", "install"
  end

  test do
    system "false"
  end
end
