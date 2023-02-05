class Rexxcsv < Formula
  desc "Rexx interface to libwebsockets"
  homepage "https://rexxcsv.sourceforge.io"
  url "https://www.rexx.org/packages/rexxcsv-1.0.1.tar.gz"
  sha256 "daed2aab7d0a3c8009bedf8cd3dbc451de8743e49b6ab068101c09dd862cdd66"
  license "GPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "regina-rexx"
  depends_on "libcsv"

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
