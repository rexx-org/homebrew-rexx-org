class The < Formula
  desc "The Hessling Editor (the), based on IBM mainframe editor XEDIT and KEDIT"
  homepage "https://hessling-editor.sourceforge.io"
#  url "https://downloads.sourceforge.net/project/hessling-editor/hessling-editor/4.0/the-4.0.tar.gz"
  url "https://www.rexx.org/packages/the-4.0.1.tar.gz"
  sha256 "d349bc93da0d96fc450e803ecbacf5d1056ed917d678a9d90aa2170bae0effca"
  license "GPL-2.0-only"

  depends_on "pkg-config" => :build
#  depends_on "regina-rexx" => :build
#  depends_on "regina-rexx"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=none",
           "--with-curses=pdcurses-vt",
           "--with-arch=none",
           "--with-homebrew=yes",
           "--with-homedir=#{HOMEBREW_PREFIX}/share/the"
    system "make", "installcommon"
  end

  test do
    system "false"
  end
end
