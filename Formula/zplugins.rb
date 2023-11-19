# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Zplugins < Formula
  desc "Collection of LV2 plugins to be bundled with Zrythm "
  homepage ""
  url "https://github.com/zrythm/ZPlugins/archive/refs/tags/v0.2.5.zip"
  version "0.2.5"
  sha256 "2aa8b1628c638ff7ba23b0b9751b382d4e99626e651f311b6293b3ffe6c4f6fa"
  license "AGPL-3.0-only"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "guile" => :build
  depends_on "malleefoul/zrythm-reqs/ztoolkit" => :build
  depends_on "libsndfile" => :build
  depends_on "cmake"
  depends_on "lv2" => :build
  depends_on "flac"
  depends_on "lame"
  depends_on "libogg"
  depends_on "libvorbis"
  depends_on "mpg123"
  depends_on "opus"
  depends_on "librsvg" #idk if it's needed but better safe than sorry

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "meson", "setup", "build", "-Dlv2dir=#{lib}/lv2", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ZPlugins`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
