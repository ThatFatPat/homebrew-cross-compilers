class X8664ElfGdb < Formula
  desc "GNU Project Debugger for x86_64-elf target"
  homepage "https://www.gnu.org/software/gdb/"
  url "https://ftp.gnu.org/pub/gnu/gdb/gdb-8.3.tar.gz"
  sha256 "b2266ec592440d0eec18ee1790f8558b3b8a2845b76cc83a872e39b501ce8a28"

  depends_on "x86_64-elf-binutils"
  depends_on "x86_64-elf-gcc"

  def install
    args = [
      "--prefix=#{prefix}",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--target=x86_64-elf",
    ]

    mkdir "build" do
      ENV.prepend_path("PATH", Formula["x86_64-elf-binutils"].opt_bin)
      ENV.prepend_path("PATH", Formula["x86_64-elf-gcc"].opt_bin)

      system "../configure", *args

      system "make"
      system "make", "install"
    end
    
    info.rmtree
    (share+"gdb").rmtree
    (share+"locale").rmtree
    (include+"gdb").rmtree
  end
end
