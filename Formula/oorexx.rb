class Oorexx < Formula
  desc "Open Object Rexx (ooRexx)"
  #  keg_only "So as to not clash with files in Regina with same name"
  homepage "https://www.oorexx.org"
  url "https://www.rexx.org/packages/oorexx-5.0.0-12583.tar.gz"
  sha256 "28270307b41cf012b8d303ac5c962644046d7658fea723aa17f84cf39c25d340"
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
