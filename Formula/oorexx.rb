class Oorexx < Formula
  desc "Open Object Rexx (ooRexx)"
  #  keg_only "So as to not clash with files in Regina with same name"
  homepage "https://www.oorexx.org"
  #url "https://www.rexx.org/packages/oorexx-5.0.0-12583.tar.gz"
  url "https://www.rexx.org/packages/oorexx-5.0.0.tar.gz"
  sha256 "e9f99a6b9ce726acf123b9753cf6673b7f466b7223db7df7fe9472859d49e9a0"
  license "CPL-1.0"

  depends_on "cmake" => :build
  depends_on "ncurses"
  conflicts_with "regina-rexx", because: "only Regina or ooRexx can be active at the same time"

  def install
    ENV.deparallelize
    system "cmake", "-S", ".", "-B", "./build", *std_cmake_args, "-Wno-error=dev"
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
