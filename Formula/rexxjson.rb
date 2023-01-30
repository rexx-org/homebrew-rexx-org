class Rexxjson < Formula
  desc "Rexx interface to cJSON"
  homepage "https://rexxjson.sourceforge.io"
  url "file:///Users/mark/projects/RexxJSON/packages/rexxjson-1.0.1.tar.gz"
  sha256 "71beabdd015e689cb346039bb56644a55237066968ebdfd7a49efb0e0dd2cc29"
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
