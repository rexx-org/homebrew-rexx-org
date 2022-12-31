class The < Formula
  desc "The Hessling Editor (the), based on IBM mainframe editor XEDIT and KEDIT"
  homepage "https://hessling-editor.sourceforge.io"
  url "https://downloads.sourceforge.net/project/hessling-editor/hessling-editor/4.0/the-4.0.tar.gz"
  sha256 "a3fb152543d91a57aec4a38886f765863e33a49d49bee6524b369e6da923d039"
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
