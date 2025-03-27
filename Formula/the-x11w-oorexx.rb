class TheX11wOorexx < Formula
  desc "The Hessling Editor (the); x11w variant using ooRexx"
  homepage "https://hessling-editor.sourceforge.io"
  url "https://www.rexx.org/packages/the-4.0.1.tar.gz"
  sha256 "0c3e8e238c82ea277ca04e8b4f05c8250cd594fe4ad86ebbc98c49c9650ad3c8"
  license "GPL-2.0-only"

  depends_on "the"
  conflicts_with "the-x11w-regina", because: "only the Regina or ooRexx version of the-x11w can be installed at a time"

  def install
    ENV.deparallelize
    opoo "If you see an error message below about Intrinsic.h being unavailable"
    opoo "it is likely you don't have the xquartz cask installed."
    opoo "Unfortunately HomeBrew does not support a Formula depending on a Cask."
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=oorexx",
           "--with-curses=pdcurses-x11w",
           "--with-arch=none",
           "--with-homebrew=yes",
           "--with-homedir=#{HOMEBREW_PREFIX}/share/the"
    system "/usr/bin/make", "installbinary"
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
