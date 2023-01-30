class TheVtw < Formula
  desc "The Hessling Editor (the); vtw variant"
  homepage "https://hessling-editor.sourceforge.io"
#  url "https://downloads.sourceforge.net/project/hessling-editor/hessling-editor/4.0/the-4.0.tar.gz"
  url "file:///Users/mark/projects/THE/packages/the-4.0.1.tar.gz"
  sha256 "6f8ad59d0ba6a4e68eee6c0e8543dd5410a41184c937a214d92db0e0087c3a40"
  license "GPL-2.0-only"

  depends_on "regina-rexx"
  depends_on "the"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-curses=pdcurses-vtw",
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
