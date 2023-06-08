# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class LibpanelDetach < Formula
  desc "libpanel with detachable windows (for Zrythm use)"
  homepage "https://git.sr.ht/~alextee/libpanel-detach"
  url "https://git.sr.ht/~alextee/libpanel-detach/archive/1.1.0-for-zrythm.tar.gz"
  sha256 "c77edbd703be746ef89b0af059d0fec249be7f59bffb3cc6791fa48f895662fd"
  license "LGPL-3.0-or-later"
  keg_only :versioned_formulae

  depends_on "gobject-introspection" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => [:build, :test]
  depends_on "vala" => :build
  depends_on "gi-docgen" => :build
  depends_on "glib" => :build
  depends_on "libadwaita"

  def install
    args = std_meson_args + %w[
      -Dvapi=true
      -Ddocs=disabled
    ]

    mkdir "build" do
      system "meson", *args, ".."
      system "ninja", "-v"
      system "ninja", "install", "-v"
    end
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <libpanel/libpanel.h>
      int main(int argc, char *argv[]) {
        panel_init ();
        return 0;
      }
    EOS
    flags = shell_output("#{Formula["pkg-config"].opt_bin}/pkg-config --cflags --libs libpanel-1").strip.split
    system ENV.cc, "test.c", "-o", "test", *flags
    system "./test"
  end
end
