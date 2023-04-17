class Switchrexx < Formula
  desc "Utility to switch the active Rexx Interpreter"
  homepage "https://switchrexx.sourceforge.io"
  url "https://www.rexx.org/packages/switchrexx-1.0.0.tar.gz"
  sha256 "37beebfaae58ae91ff2bd118f02dfe3c10a01abd0c8bde59c033c732dc884786"
  license "CPL-1.0"

  def install
    bin.install "switchrexx.rexx" => "switchrexx"
  end

  test do
    system "false"
  end
end
