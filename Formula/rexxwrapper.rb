class Rexxwrapper < Formula
  desc "Rexx interface to libwebsockets"
  homepage "https://rexxwrapper.sourceforge.io"
  url "file:///Users/mark/projects/RexxWrapper/packages/RexxWrapper-3.1.tar.gz"
  sha256 "297ba2d6e50a819f573bb6c6adb234d4bae2d15251592344d0bf3ebc6f5493b8"
  license "GPL-2.0-only"

  depends_on "regina-rexx"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-arch=none"
    system "make", "install"
  end

  test do
    system "false"
  end
end
