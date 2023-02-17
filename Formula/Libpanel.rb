# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Libpanel < Formula
  desc "A dock/panel library for GTK 4"
  homepage "https://gitlab.gnome.org/GNOME/libpanel"
  url "https://download.gnome.org/sources/libpanel/1.1/libpanel-1.1.0.tar.xz"
  sha256 "a19f6ecdbc82e601be38da0a93ebd913f4c43769fe4ab4f334c35deb8b3a2f11"
  license "LGPL-3.0-or-later"

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
