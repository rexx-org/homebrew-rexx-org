class Oorexx < Formula
  desc "Open Object Rexx (ooRexx)"
#  keg_only "So as to not clash with files in Regina with same name"
  homepage "https://www.oorexx.org"
  url "https://www.rexx.org/packages/oorexx-5.0.0-12583.tar.gz"
  sha256 "7a37c166dc5ccc0e021f1f1ec93172b5d00c20faa9d688fea31fb8e836501aa7"
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
    (testpath/"test").write <<~EOS
      #!#{bin}/rexx
      Parse Version ver
      Say ver
    EOS
    chmod 0755, testpath/"test"
    assert_match version.to_s, shell_output(testpath/"test")
  end
end
