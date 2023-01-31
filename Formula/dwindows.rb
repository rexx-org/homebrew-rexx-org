class Dwindows < Formula
  desc "Dynamic Windows UI Toolkit"
  homepage "http://dwindows/netlabs.org"
  url "https://dbsoft.org/dwindows/dwindows-3.3.tar.gz"
  sha256 "e5b63c45a55b7f710e5b5ef3ca702ff411150365032ba11a7fd8e5956ac513e4"
  license "0BSD"

  depends_on "pkg-config" => :build

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules"
    system "make", "install"
  end

  test do
    system "false"
  end
end
