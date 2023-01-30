class The < Formula
  desc "The Hessling Editor (the), based on IBM mainframe editor XEDIT and KEDIT"
  homepage "https://hessling-editor.sourceforge.io"
#  url "https://downloads.sourceforge.net/project/hessling-editor/hessling-editor/4.0/the-4.0.tar.gz"
  url "file:///Users/mark/projects/THE/packages/the-4.0.1.tar.gz"
  sha256 "6f8ad59d0ba6a4e68eee6c0e8543dd5410a41184c937a214d92db0e0087c3a40"
  license "GPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "regina-rexx" => :build
  depends_on "regina-rexx"
  license "GPL-2.0-only"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=none",
           "--with-curses=pdcurses-vt",
           "--with-arch=none",
           "--with-homedir=#{HOMEBREW_PREFIX}/share/the"
    system "make", "installcommon"
  end

  test do
    system "false"
  end
end
