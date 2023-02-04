class Rexxws < Formula
  desc "Rexx interface to libwebsockets"
  homepage "https://rexxws.sourceforge.io"
  url "file:///Users/mark/projects/RexxWS/packages/rexxws-1.2.0.tar.gz"
  sha256 "807b5bf25ce54edb649239e1b96f1e2fe6a2fb7abc9024193ba3682058fd9368"
  license "GPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "libwebsockets"
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
