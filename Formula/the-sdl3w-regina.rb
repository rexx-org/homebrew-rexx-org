class TheSdl3wRegina < Formula
  desc "The Hessling Editor (the); sdl3w variant using Regina"
  homepage "https://hessling-editor.sourceforge.io"
  url "https://www.rexx.org/packages/the-4.0.1.tar.gz"
  sha256 "10b5263c16051ac0e8e66e80efbb49f36bc997648cced3c89f150db2c6282e03"
  license "GPL-2.0-only"

  depends_on "pkg-config"
  depends_on "regina-rexx"
  depends_on "sdl3"
  depends_on "sdl3_ttf"
  depends_on "the"
  conflicts_with "the-sdl3w-oorexx", because: "only the Regina or ooRexx version of the-sdl3w can be installed at a time"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-curses=pdcurses-sdl3w",
           "--with-arch=none",
           "--disable-font-check",
           "--with-homebrew=yes",
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
