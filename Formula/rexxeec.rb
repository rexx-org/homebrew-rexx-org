class Rexxeec < Formula
  desc "Rexx interface to libwebsockets"
  homepage "https://rexxeec.sourceforge.io"
  url "file:///Users/mark/projects/RexxEEC/packages/rexxeec-1.4.0.tar.gz"
  sha256 "5562e8acdcc3ffd2fa248898e8cc2ba6a2c601dec0fada10a4285d55317846a7"
  license "GPL-2.0-only"

  depends_on "pkg-config" => :build
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
