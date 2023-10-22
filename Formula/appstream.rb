# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Appstream < Formula
  desc "Tools and libraries to work with AppStream metadata"
  homepage ""
  url "https://www.freedesktop.org/software/appstream/releases/AppStream-0.16.3.tar.xz"
  mirror "https://github.com/ximion/appstream/archive/refs/tags/v0.16.3.tar.gz"
  version "0.16.3"
  sha256 "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8e6344a2b318b98b1"
  license "LGPL-2.1+"
  head "https://github.com/ximion/appstream.git", branch: "main"

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
  depends_on "pcre2" => :build
  depends_on "zstd" => :build
  depends_on "gcc@13" => :build
  depends_on "gnu-sed" => :build
  depends_on "gettext" => :build
  depends_on "itstool" => :build
  depends_on "xz" => :build
  depends_on "ucommon" => :build

# fails_with :clang

patch do
  url "https://github.com/MalleeFoul/Homebrew-zrythm-reqs/raw/main/patch/appstream1.diff" #apparently, on mac sed is weird, so I gotta use gsed.
  sha256 "2ab5c3be4479697b3b0dbd99ace68491de29b0900fa6dd91a28fa28e68b99e87"
end

  def install


    # inreplace "meson.build",
    #   "/usr/include",
    #   "/usr/local/include"


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
