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
class CarlaGit < Formula
  desc "Audio plugin host supporting LADSPA, LV2, VST2/3, SF2 and more"
  homepage "https://kxstudio.linuxaudio.org/Applications:Carla"
  url "https://github.com/falkTX/Carla/archive/1b5f7e9f3509c8af81507470e44fc632591a1cdf.zip"
  sha256 "39ba0265a99445fe16fefd457d3f5037148e17279ba47090c86e05ac2d131a1b"
  head "https://github.com/falkTX/Carla.git"
  version "0.2.1"
  keg_only "versions formulae"

  depends_on "ccache" => :build
  depends_on "pkg-config" => :build
  depends_on "fluid-synth"
  depends_on "liblo"
  depends_on "libmagic"
  depends_on "pyqt@5"
  depends_on "python@3.10"

  def install
    system "make", "NOOPT=true", "SKIP_STRIPPING=true"
    system "make", "install", "PREFIX=#{prefix}"

    inreplace bin/"carla", "PYTHON=$(which python3 2>/dev/null)",
                           "PYTHON=#{Formula["python@3.9"].opt_bin}/python3"
    system "cp", "#{lib}/carla/carla-discovery-native",
      "#{bin}/"
  end

  test do
    system bin/"carla", "--version"
    system lib/"carla/carla-discovery-native", "internal", ":all"
  end
end
