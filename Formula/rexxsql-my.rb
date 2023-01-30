class RexxsqlMy < Formula
  desc "Rexx interface to mySQL"
  homepage "https://rexxsql.sourceforge.io"
  url "file:///Users/mark/projects/RexxSQL/packages/rexxsql-2.7.0.tar.gz"
  sha256 "777f614732374ac3b03a28f366a509935c126eb9feaa9b22dbc984a2900a648a"
  license "GPL-2.0-only"

  depends_on "regina-rexx"
  depends_on "mysql"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-arch=none",
           "--with-db=mysql",
           "--with-brew-addon-dir=#{lib}/regina-rexx/addons"
    system "make", "installbase", "installaddonslink"
  end

  test do
    system "false"
  end
end
