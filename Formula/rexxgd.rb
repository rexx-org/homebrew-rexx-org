class Rexxgd < Formula
  desc "Rexx interface to libgd graphics library"
  homepage "https://rexxgd.sourceforge.io"
  url "file:///Users/mark/projects/RexxGd/packages/rexxgd-2.2.0.tar.gz"
  sha256 "f1586a2f7981eed8182e7a878ddace380ac478b8689eab94909316b3d7558e64"
  license "GPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "regina-rexx" => :build
  depends_on "gd"
  depends_on "regina-rexx"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-arch=none",
           "--with-brew-addon-dir=#{lib}/regina-rexx/addons",
           "--with-freetype",
           "--with-xpm"
    system "make", "install"
  end

  test do
    system "false"
  end
end
