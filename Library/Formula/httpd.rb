require 'formula'

class Httpd < Formula
  url 'http://mirrors.ibiblio.org/pub/mirrors/apache/httpd/httpd-2.2.21.tar.bz2'
  homepage 'http://httpd.apache.org/'
  sha1 'c02f9b05da9a7e316ff37d9053dc76a57ba51cb4'

  skip_clean :all

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-layout=GNU",
                          "--enable-mods-shared=all",
                          "--with-ssl=/usr",
                          "--with-mpm=prefork",
                          "--disable-unique-id",
                          "--enable-ssl",
                          "--enable-dav",
                          "--enable-cache",
                          "--enable-proxy",
                          "--enable-logio",
                          "--enable-deflate",
                          "--with-included-apr",
                          "--enable-cgi",
                          "--enable-cgid",
                          "--enable-suexec",
                          "--enable-rewrite"
    system "make"
    system "make install"
  end

end
