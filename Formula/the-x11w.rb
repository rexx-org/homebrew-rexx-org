class TheX11w < Formula
  desc "The Hessling Editor (the); x11w variant"
  homepage "https://hessling-editor.sourceforge.io"
  url "https://www.rexx.guru/the-4.0.tar.gz"
  sha256 "8c515a991895d47117fc56a52cb86d8fc3f1d842ebe422d3af5edafd051bbb54"
  license "GPL-2.0-only"

  depends_on "pkg-config"
  depends_on "libxaw"
  depends_on "regina-rexx"
  depends_on "the"

  def install
    ENV.deparallelize
    opoo "If you see an error message below about Intrinsic.h being unavailable please let me know at mark@rexx.org"
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
