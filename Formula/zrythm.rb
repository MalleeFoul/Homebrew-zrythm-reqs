# Copyright (C) 2020-2021 Alexandros Theodotou <alex at zrythm dot org>
#
# This file is part of Zrythm
#
# Zrythm is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Zrythm is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Zrythm.  If not, see <https://www.gnu.org/licenses/>.
#
class Zrythm < Formula
  desc "Digital audio workstation"
  homepage "https://www.zrythm.org"
  url "https://github.com/zrythm/zrythm/archive/refs/tags/v1.0.0-beta.4.13.31.zip"
  sha256 "aae4d3871dd820b6c5a68667f6a12f835a403cff4557eaeaeab5eabd2045c4b2"
  version "1.4.13.31"

  depends_on "ccache" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "help2man" => :build
  depends_on "cmake" => :build
  depends_on "gnu-sed" => :build
  depends_on "sassc" => :build
  depends_on "glib-utils" => :build
  depends_on "guile" => :build
  depends_on "itstool" => :build
  depends_on "boost"
  depends_on "libsoxr" => :build
  depends_on "curl"
  depends_on "libyaml"
  depends_on "fftw"
  depends_on "libsamplerate"
  depends_on "libsass"
  depends_on "libxmlb"
  depends_on "libxslt"
  depends_on "lilv"
  depends_on "librsvg"
  depends_on "malleefoul/versions/gtksourceview5@4.13"
  depends_on "graphviz"
  depends_on "rubberband"
  depends_on "sdl2"
  depends_on "rtaudio"
  depends_on "rtmidi"
  depends_on "zstd"
  depends_on "malleefoul/zrythm-reqs/carla-git" => :build
  depends_on "jack"
  depends_on "qjackctl"
  depends_on "pcre2"
  depends_on "xxhash"
  depends_on "vamp-plugin-sdk"
  depends_on "json-glib"
  depends_on "malleefoul/zrythm-reqs/libcyaml" => :build
  depends_on "malleefoul/zrythm-reqs/Libpanel-Detach" => :build
  depends_on "malleefoul/zrythm-reqs/zplugins"
  depends_on "malleefoul/versions/gtk4@4.13" => :build
  depends_on "libadwaita" => :build
  depends_on "appstream" => :build
  
  
  
  

  def install
    mkdir "build" do

      # workaround for C++ 20 <version>
      system "mv", "../VERSION", "../VERSION.txt"
      system "gsed", "-i", "s|'VERSION'|'VERSION.txt'|", "../meson.build"
      system "gsed", "-i", "s|'4.13'|'4.12'|", "../meson.build"

      # configure
      system "meson", "setup",
        "--prefix=#{prefix}", "--libdir=#{lib}",
        "-Dextra_debug_info=true",
        "-Doptimization,
        "-Dtests=false", "-Dtrial_ver=false",
        "-Dcarla=enabled",
        "-Dx11=disabled",
        "-Drtmidi=auto", "-Drtaudio=auto",
        "-Dfallback_version=1",
        # manpage fails
        "-Dmanpage=false",
        # TODO enable
        "-Dstatic_deps=false",
        "-Dcheck_updates=true",
        "-Dinstaller_ver=true",
        "-Dvamp_static=true",
        "-Dcarla_use_cv32_patchbay_variant=true",
        "-Dguile=disabled",
        ".."


      # build
      system "meson compile"
      # system "ninja", "-v"
      

      # install
      system "meson", "install", "--skip-subprojects=reproc,rtaudio,rtmidi"

      system "mkdir", "-p", "#{prefix}/LICENSES"
      system "cp", "-RLv", "../LICENSES", "#{prefix}/"
    end
  end

  def post_install
    system "cp", "-r", "#{Formula["kf5-breeze-icons"].share}/icons/breeze-dark", "#{share}/icons/breeze-dark"
      system "mkdir", "-p", "#{lib}/lv2"
      system "cp", "-RLv", "#{Formula["zplugins"].lib}/lv2", "#{lib}/"
  end

  test do
    system "#{bin}/zrythm", "--version"
  end
end
