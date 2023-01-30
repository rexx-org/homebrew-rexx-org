class Rexxpdf < Formula
  desc "Rexx interface to libwebsockets"
  homepage "https://rexxpdf.sourceforge.io"
  url "file:///Users/mark/projects/RexxPDF/packages/rexxpdf-1.0.tar.gz"
  sha256 "79068cfa4ba86696eca3adaa794451f7e1f7bc1badd8a6e3f8d0c1a1f6b39e3a"
  license "GPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "regina-rexx"
  depends_on "libharu"

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
