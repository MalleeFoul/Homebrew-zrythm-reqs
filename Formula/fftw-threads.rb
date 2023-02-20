# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class FftwThreads < Formula
  desc ""
  homepage ""
  url "http://www.fftw.org/fftw-3.3.10.tar.gz"
  sha256 "56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467"
  license ""

  bottle do
    sha256 cellar: :any,                 arm64_ventura:  "f118b9b10a302aaa0a937b9c3004a1610a522f365022ab12e90e7ee929823ff4"
    sha256 cellar: :any,                 arm64_monterey: "ac39928c08c6cec08f61b31c37ea69be21f6020c5c50bbdc66751fc1907ee600"
    sha256 cellar: :any,                 arm64_big_sur:  "de50d4cd3e5de39ccbc168a8eb8555f9e36609198c9e4f91c1d1da122674d066"
    sha256 cellar: :any,                 ventura:        "31e8c75b13d33a17164163f3c5f5bb6605e26b2328a617696b0fae5aa08e8ad4"
    sha256 cellar: :any,                 monterey:       "dc7a704928be8c4724db42be3161aebf3f0d3b8e0f79e893bc1b294aed4ca770"
    sha256 cellar: :any,                 big_sur:        "bd3ae1b553913b3b627bd1af592d84da4c6a93e45dde5af4df7c393564b0f174"
    sha256 cellar: :any,                 catalina:       "f2b0548dfd646545af732cb6ee7f1d58c1950067e4f7fd558655fb388e464897"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c2b552eb0c8d31f577713c2e39ed6a22bd430d30d430d242767f253057839dca"
  end


  # depends_on "cmake" => :build
  on_macos do
    depends_on "gcc"
  end

fails_with :clang


  def install
    
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", "--enable-threads" *std_configure_args, "--disable-silent-rules"
    system "make"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test FFTW-Threads`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
