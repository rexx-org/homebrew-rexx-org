class Rexxswitch < Formula
  desc "Utility to switch the active Rexx Interpreter"
  homepage "https://rexxswitch.sourceforge.io"
  url "https://www.rexx.org/packages/rexxswitch-1.0.0.tar.gz"
  sha256 "889206c3d6ca07bbad1e5faf85a5344ff9dd21139fcbae53b361dee8e6f4b838"
  license "CPL-1.0"

  def install
    bin.install "rexxswitch.rexx" => "rexxswitch"
  end

  test do
    system "false"
  end
end
