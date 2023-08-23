class TheVtwOorexx < Formula
  desc "The Hessling Editor (the); vtw variant using ooRexx"
  homepage "https://hessling-editor.sourceforge.io"
#  url "https://downloads.sourceforge.net/project/hessling-editor/hessling-editor/4.0/the-4.0.tar.gz"
  url "https://www.rexx.org/packages/the-4.0.1.tar.gz"
  sha256 "f6582c5cedc429dd8d47ed5f51c36a13e792b083d673022a84bbd4476ef401dc"
  license "GPL-2.0-only"

  depends_on "the"
  conflicts_with "the-vtw-regina", because: "only the Regina or ooRexx version of the-vtw can be installed at a time"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=oorexx",
           "--with-curses=pdcurses-vtw",
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
