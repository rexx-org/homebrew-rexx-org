class Rexxcurl < Formula
  desc "Rexx interface to libwebsockets"
  homepage "https://rexxcurl.sourceforge.io"
  url "file:///Users/mark/projects/RexxCURL/packages/rexxcurl-2.1.0.tar.gz"
  sha256 "fb3e6a3472cf5371bea2ab34b140027976e902fd1150dc1c5340b2919e8b0b3e"
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
