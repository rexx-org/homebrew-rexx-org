class TheSdl2w < Formula
  desc "The Hessling Editor (the); sdl2w variant"
  homepage "https://hessling-editor.sourceforge.io"
  url "https://www.rexx.org/packages/the-4.0.1.tar.gz"
  sha256 "b9a3833c722e54498d8bdf97119591fac96ccb45e72cfadb9b24911b7223bbe6"
  license "GPL-2.0-only"

  depends_on "pkg-config"
  depends_on "regina-rexx"
  depends_on "sdl2"
  depends_on "sdl2_ttf"
  depends_on "the"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-curses=pdcurses-sdl2w",
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
