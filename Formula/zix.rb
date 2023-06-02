# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Zix < Formula
  desc "A lightweight C99 portability and data structure library"
  homepage "https://gitlab.com/drobilla/zix"
  url "https://gitlab.com/drobilla/zix/-/archive/main/zix-main.tar.gz"
  version "0.3.3"
  sha256 "eae6251de50e2519bc7ead3ad4eef466320e25a53034bd30a3f13c764b177c7b"
  license "ISC"

  depends_on "meson" => :build
  depends_on "ninja" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test zix-main`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
