# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Libaudec < Formula
  desc "library for reading and resampling audio files"
  homepage "https://git.zrythm.org/zrythm/libaudec"
  url "https://git.sr.ht/~alextee/libaudec/archive/v0.3.4.tar.gz"
  mirror "https://github.com/zrythm/libaudec/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "edaf7cb187c5e0235e527cde741708e7c8144c9a0c837182dd36d61f5ea26f23"
  license "AGPLv3+"
  version "0.3.4"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "cmake" => :build
  depends_on "libsndfile"
  depends_on "libsamplerate"
  depends_on "openlibm"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "meson", "setup", "build", *std_meson_args
    system "ninja", "-C", "build", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libaudec`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
