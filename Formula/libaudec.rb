# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Libaudec < Formula
  desc "libaudec (lib audio decoder) is a wrapper library over minimp3, sndfile and libsamplerate for reading and resampling audio files, based on Robin Gareus' audio_decoder code (https://github.com/x42/silan/tree/master/audio_decoder)

  libaudec supports all formats supported by sndfile, in addition to MP3."
  homepage "https://git.sr.ht/~alextee/libaudec"
  url "https://git.sr.ht/~alextee/libaudec/archive/e1003934f0bcc14af44366f1951c2a97a72e4835.tar.gz"
  sha256 "1a4a7ff1d7f30ed1aa8395ad52be8210666b348feecf8eca16e0168bb9c10dc0"
  license ""

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "meson", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
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
