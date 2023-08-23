class Switchrexx < Formula
  desc "Utility to switch the active Rexx Interpreter"
  homepage "https://switchrexx.sourceforge.io"
  url "https://www.rexx.org/packages/switchrexx-1.0.1.tar.gz"
  sha256 "ad3cab45b16962ca0b7107b3478e486109cae0107533f306aaf7f3a79439128a"
  license "CPL-1.0"

  def install
    bin.install "switchrexx.rexx" => "switchrexx"
  end

  test do
    system "false"
  end
end
