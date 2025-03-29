class TheConwOorexx < Formula
  desc "The Hessling Editor (the); ncursesw variant using ooRexx"
  homepage "https://hessling-editor.sourceforge.io"
  url "https://www.rexx.org/packages/the-4.0.1.tar.gz"
  sha256 "cd98518185a937bf37814c5c7b969432db69790a7ae8ea247008035826cf1715"
  license "GPL-2.0-only"

  depends_on "ncurses"
  depends_on "pkg-config"
  depends_on "the"
  conflicts_with "the-conw-regina", because: "only the Regina or ooRexx version of the-conw can be installed at a time"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=oorexx",
           "--with-curses=ncursesw",
           "--with-arch=none",
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
