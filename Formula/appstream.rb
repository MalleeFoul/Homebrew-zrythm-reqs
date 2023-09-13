# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Appstream < Formula
  desc ""
  homepage ""
  url "https://www.freedesktop.org/software/appstream/releases/AppStream-0.16.3.tar.xz"
  version "0.16.3"
  sha256 "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8e6344a2b318b98b1"
  license "LGPL-2.1+"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "glib"
  depends_on "libxml"
  depends_on "libcurl"
  depends_on "libyaml"
  depends_on "libxml2"

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
    # software. Run the test with `brew test AppStream`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
