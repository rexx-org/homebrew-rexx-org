class Rexxdw < Formula
  desc "Rexx interface to Dynamic Windows UI Toolkit"
  homepage "https://rexxws.sourceforge.io"
  url "https://www.rexx.org/packages/rexxdw-2.2.0.tar.gz"
  sha256 "8d9f3ca6e05ff94b29af39ae186f039e83d134d6c493f5fefb2f7dba502f8d56"
  license "GPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "dwindows"
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
