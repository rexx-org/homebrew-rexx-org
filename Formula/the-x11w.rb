class TheX11w < Formula
  desc "The Hessling Editor (the); x11w variant"
  homepage "https://hessling-editor.sourceforge.io"
  url "https://www.rexx.guru/the-4.0.tar.gz"
  sha256 "1791786134d9e8f89b88dd8c8cdfa132c5237cc9bd00aaf114265a2fd49cf057"
  license "GPL-2.0-only"

  depends_on "pkg-config"
  depends_on "libxaw"
  depends_on "regina-rexx"
  depends_on "the"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-curses=pdcurses-x11w",
           "--with-arch=none",
           "--with-homedir=#{HOMEBREW_PREFIX}/share/the"
    system "make", "installbinary"
  end

  test do
    File.write("a.txt", "")
    File.write("b.txt", "Hello, world!\n")
    File.write("test.the", "'i Hello, world!'\n'file'\n")
    system "#{bin}/the", "-b", "-p", "test.the", "a.txt"
    a=File.read("a.txt")
    b=File.read("b.txt")
    assert_equal(a, b)
  end
end
