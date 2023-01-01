class Configfail < Formula
  desc "A package to test pkg-config in brew install"
  homepage "https://www.rexx.guru"
  url "https://www.rexx.guru/configfail-1.0.tar.gz"
  sha256 "d806882de2d535d77eeb3f647cbad7ec6c7a27cb8885c1bf5bbae2bfa69c1433"
  license "GPL-2.0-only"

  def install
    ENV.deparallelize
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--with-package=xaw"
  end

  test do
    system "false"
  end
end
