class Switchrexx < Formula
  desc "Utility to switch the active Rexx Interpreter"
  homepage "https://switchrexx.sourceforge.io"
  url "https://www.rexx.org/packages/switchrexx-1.0.0.tar.gz"
  sha256 "df83adf4cf6f243f532c139b08e928c160068b05b910b120bc8a4687fd26fc99"
  license "CPL-1.0"

  def install
    bin.install "switchrexx.rexx" => "switchrexx"
  end

  test do
    system "false"
  end
end
