# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

class Libcyaml < Formula
  desc "C library for reading and writing YAML. "
  homepage "https://github.com/tlsa/libcyaml"
  url "https://github.com/tlsa/libcyaml/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "49362382e5d40846d0d4af93668eb5a89a13a8b6650324903ac54cb0f1b36650"
  license "ISC License"

  depends_on "make" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "make", "VARIANT=release"
    system "make", "install", "VARIANT=release"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    system "make", "test"
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libcyaml`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    
    system "false"
  end
end
