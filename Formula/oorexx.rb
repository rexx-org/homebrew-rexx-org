class Oorexx < Formula
  desc "Open Object Rexx (ooRexx)"
#  keg_only "So as to not clash with files in Regina with same name"
  homepage "https://www.oorexx.org"
  url "https://www.rexx.org/packages/oorexx-5.0.0-12583.tar.gz"
  sha256 "338314a4627a8a4ecd9f402050d41ba7329b56fe110b7ddf42bfa0caf177e301"
  license "CPL-1.0"

  depends_on "ncurses"
  conflicts_with "regina-rexx", because: "Only Regina or ooRexx can be active at the same time"

  def install
    ENV.deparallelize
    system "./cmake",
           "-G", "Unix Makefiles",
           "-S", ".",
           "-B", "./build",
           *std_cmake_args
    cd "./build" do
       system "make", "install"
    end
  end

  test do
    system "false"
  end
end
