class TheConwRegina < Formula
  desc "The Hessling Editor (the); ncursesw variant using Regina"
  homepage "https://hessling-editor.sourceforge.io"
  url "https://www.rexx.org/packages/the-4.0.1.tar.gz"
  sha256 "208bdeac15fa1679a3c161d8cbba960bb76b4249e9ade8ae929a19199b58dced"
  license "GPL-2.0-only"

  depends_on "ncurses"
  depends_on "pkg-config"
  depends_on "regina-rexx"
  depends_on "the"
  conflicts_with "the-conw-oorexx", because: "only the Regina or ooRexx version of the-conw can be installed at a time"

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