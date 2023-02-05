class RexxsqlLite < Formula
  desc "Rexx interface to sqlite3"
  homepage "https://rexxsql.sourceforge.io"
  url "https://www.rexx.org/packages/rexxsql-2.7.0.tar.gz"
  sha256 "41f683fa37e6cec77fc5e1b02c3756b958054823ea280aef9ea821177ad172e2"
  license "GPL-2.0-only"

  depends_on "regina-rexx"
  depends_on "sqlite"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-arch=none",
           "--with-db=sqlite3",
           "--with-brew-addon-dir=#{lib}/regina-rexx/addons"
    system "make", "installdbtools", "installdbaddons", "installdbaddonslink"
  end

  test do
    system "false"
  end
end
