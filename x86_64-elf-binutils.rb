class X8664ElfBinutils < Formula
  desc "Binutils for x86_64-elf target"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://ftp.gnu.org/pub/gnu/binutils/binutils-2.33.1.tar.gz"
  sha256 "98aba5f673280451a09df3a8d8eddb3aa0c505ac183f1e2f9d00c67aa04c6f7d"

  def install
    args = [
      "--disable-debug",
      "--disable-dependency-tracking",
      "--prefix=#{prefix}",
      "--infodir=#{info}",
      "--mandir=#{man}",
      "--target=x86_64-elf",
      "--disable-nls",
      "--disable-werror",
      "--with-sysroot",
    ]

    mkdir "build" do
      system "../configure", *args

      system "make"
      system "make", "install"
    end

    info.rmtree # info files conflict with native binutils
  end
end
