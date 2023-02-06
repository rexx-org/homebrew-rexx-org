class TheConw < Formula
  desc "The Hessling Editor (the); ncursesw variant"
  homepage "https://hessling-editor.sourceforge.io"
  url "https://www.rexx.org/packages/the-4.0.1.tar.gz"
  sha256 "33c0c8dd4c032efd3d85bcb925c177992c75f07c1fcebf25020c3cec13d47b11"
  license "GPL-2.0-only"

  depends_on "ncurses"
  depends_on "pkg-config"
  depends_on "regina-rexx"
  depends_on "the"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
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
