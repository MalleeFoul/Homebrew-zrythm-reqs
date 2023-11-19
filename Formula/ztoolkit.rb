# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Ztoolkit < Formula
  desc "A cross-platform GUI toolkit"
  homepage "https://github.com/alex-tee/ztoolkit"
  url "https://github.com/alex-tee/ztoolkit/archive/refs/tags/v0.1.2.zip"
  version "0.1.2"
  sha256 "27bb1216225567c5781e4b9f2cd7986616fd3de0e044db6b5132ffcafc8000e5"
  license "AGPL-3.0-only"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "cairo" => :build
  depends_on "libx11" => :build
  depends_on "librsvg" => :build
  depends_on "cmake"
  depends_on "xorgproto"
  depends_on "xcb-proto"
  depends_on "libxcb"
  depends_on "freetype"
  depends_on "glib"
  depends_on "libpng"
  depends_on "gdk-pixbuf"
  depends_on "libxext"
  depends_on "libxrender"
  depends_on "lzo"
  depends_on "pixman"
  depends_on "libpng"
  depends_on "fontconfig"
  depends_on "libxfont2"
  #too many dependenccies aaaaa
  

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "meson", "setup", "build", "-Denable_rsvg=true", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ztoolkit`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
