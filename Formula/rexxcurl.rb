class Rexxcurl < Formula
  desc "Rexx interface to libwebsockets"
  homepage "https://rexxcurl.sourceforge.io"
  url "https://www.rexx.org/packages/rexxcurl-2.1.0.tar.gz"
  sha256 "6b90c98408df6f04935776b6570a660fe32a79a3e6d0cb74a8f3f713e3b44e46"
  license "GPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "curl"
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
