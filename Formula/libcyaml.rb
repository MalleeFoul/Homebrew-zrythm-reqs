# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Libcyaml < Formula
  desc "C library for reading and writing YAML."
  homepage "https://github.com/tlsa/libcyaml/"
  url "https://github.com/tlsa/libcyaml/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "8dbd216e1fce90f9f7cca341e5178710adc76ee360a7793ef867edb28f3e4130"
  license ""
  version "1.4.1"

  depends_on "libyaml" => :build


  def install
    ENV["PREFIX"] = "#{prefix}"
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "make", "VARIANT=release"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test LibCYAML`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
