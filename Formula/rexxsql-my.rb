class RexxsqlMy < Formula
  desc "Rexx interface to mySQL"
  homepage "https://rexxsql.sourceforge.io"
  url "https://www.rexx.org/packages/rexxsql-2.7.0.tar.gz"
  sha256 "2eaa9649e20e66dc22ee0f34ad0841f4285f0681ee4fae78a16f2a35e746c7a7"
  license "GPL-2.0-only"

  depends_on "mysql"
  depends_on "regina-rexx"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-rexx=regina",
           "--with-arch=none",
           "--with-db=mysql",
           "--with-brew-addon-dir=#{lib}/regina-rexx/addons"
    system "make", "installdbtools", "installdbaddons", "installdbaddonslink"
  end

  test do
    system "false"
  end
end
