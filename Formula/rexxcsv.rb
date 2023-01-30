class Rexxcsv < Formula
  desc "Rexx interface to libwebsockets"
  homepage "https://rexxcsv.sourceforge.io"
  url "file:///Users/mark/projects/RexxCSV/packages/rexxcsv-1.0.1.tar.gz"
  sha256 "9306142d59de345407b03aaa7d9e8a2b0eb950f8bafec5d536f3ba3e0f3cb493"
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
