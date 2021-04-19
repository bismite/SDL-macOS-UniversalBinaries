#!/bin/bash

mkdir build
PREFIX=$(pwd)/build
echo ${PREFIX}

rm -rf /tmp/mpg123-1.26.5-arm64
tar jxf mpg123-1.26.5.tar.bz2 -C /tmp
mv /tmp/mpg123-1.26.5 /tmp/mpg123-1.26.5-arm64
(
  cd /tmp/mpg123-1.26.5-arm64 ;
  ./configure --prefix=${PREFIX}/arm64 --enable-static=no --with-cpu=aarch64 --host=x86_64-apple-darwin --build=aarch64 CFLAGS="-O3 -g0 -DNDEBUG -arch arm64" LDFLAGS="-arch arm64" ;
  make install
)
