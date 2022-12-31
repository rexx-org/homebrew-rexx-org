class The < Formula
  desc "The Hessling Editor (the), based on IBM mainframe editor XEDIT and KEDIT"
  homepage "https://www.paddle.systems"
  url "https://sourceforge.net/projects/hessling-editor/files/hessling-editor/4.0/the-4.0.tar.gz"
  sha256 "a3fb152543d91a57aec4a38886f765863e33a49d49bee6524b369e6da923d039"
  license "GPL-2.0-only"

  depends_on "regina-rexx"

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-curses=pdcurses-vt",
           "--with-arch=none"
    system "make", "installcommon"
  end

  test do
    system "false"
  end
end
