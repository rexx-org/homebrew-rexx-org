class Rexxcurl < Formula
  desc "Rexx interface to libwebsockets"
  homepage "https://rexxcurl.sourceforge.io"
  url "https://www.rexx.org/packages/rexxcurl-2.1.0.tar.gz"
  sha256 "7130ffacb572f899bda801b30cb1d7f80bda1cf3192f076cbc31a6e56bf10732"
  license "GPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "regina-rexx"
  depends_on "curl"

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
