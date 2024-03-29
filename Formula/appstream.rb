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
  depends_on "gnu-sed" => :build
  depends_on "gettext" => :build
  depends_on "itstool" => :build
  depends_on "docbook" => :build
  depends_on "docbook-xsl" => :build
  depends_on "xz" => :build
  depends_on "ucommon" => :build
  depends_on "gtk-doc" => :build
  depends_on "tre" => :build
  depends_on "reproc" => :build
  depends_on "mpfr" => :build
  depends_on "libmpc" => :build
  depends_on "gmp" => :build
  depends_on "llvm" => :build


  # depends_on "" => :build

 fails_with :gcc13

 fails_with :clang

patch do #patch 1
  url "https://github.com/MalleeFoul/Homebrew-zrythm-reqs/raw/main/patch/appstream1.diff" #apparently, on mac sed is weird, so I gotta use gsed.
  sha256 "2ab5c3be4479697b3b0dbd99ace68491de29b0900fa6dd91a28fa28e68b99e87"
end

patch do #patch 2
  url "https://github.com/MalleeFoul/Homebrew-zrythm-reqs/raw/main/patch/appstream2.diff"
  sha256 "632a4cde4ad73a9c0c92c1aeca7cb61b7109a76ed81821dcde269012a431a080"
end

patch do #patch 3
  url "https://github.com/MalleeFoul/Homebrew-zrythm-reqs/raw/main/patch/appstream3.diff"
  sha256 "d88ce08f429b78518410cc005e4aae4c48b07faafef1a99adacb00d3f6148b37"
end

patch do #patch 4
  url "https://github.com/MalleeFoul/Homebrew-zrythm-reqs/raw/main/patch/appstream4.diff"
  sha256 "777176b9cc9629b89a10ea750da7a3f35974fcf0ba0498e35b00e1e3e9d10f83"
end

  def install
    ENV.append "CFLAGS", "-std=c++11 -stdlib=libc++"
    ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
    ENV.libcxx

    # inreplace "meson.build",
    #   "/usr/include",
    #   "/usr/local/include"


    # ENV.deparallelize  # if your formula fails when building in parallel
    system "meson", "setup", "build", *std_meson_args, "-Dsystemd=false", "-Dapidocs=false"
    system "ninja", "-C", "build"
    system "ninja", "-C", "build", "install"


    # system "meson", "compile", "-C", "build", "--verbose"
    # system "meson", "install", "-C", "build"
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
