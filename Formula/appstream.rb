# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Appstream < Formula
  desc ""
  homepage ""
  url "https://www.freedesktop.org/software/appstream/releases/AppStream-0.16.2.tar.xz"
  version "0.16.2"
  sha256 "f9cb80bd388fbf06be268afa7f2d65863c85d605ad874b905094f3982d03f232"
  license "LGPL-2.1+"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "glib" => :build
  depends_on "libxml2" => :build
  depends_on "gobject-introspection" => :build
  depends_on "curl" => :build
  depends_on "snowball" => :build
  depends_on "libyaml" => :build
  depends_on "libxmlb" => :build
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build


  def install


    inreplace "meson.build",
      "/usr/include",
      "/usr/local/include"
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "meson", "setup", "build", *std_meson_args, "-Dsystemd=false"
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
