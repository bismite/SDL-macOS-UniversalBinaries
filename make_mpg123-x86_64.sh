#!/bin/bash

mkdir build
PREFIX=$(pwd)/build
echo ${PREFIX}

rm -rf /tmp/mpg123-1.29.0-x86_64
tar jxf mpg123-1.29.0.tar.bz2 -C /tmp
mv /tmp/mpg123-1.29.0 /tmp/mpg123-1.29.0-x86_64
(
  cd /tmp/mpg123-1.29.0-x86_64 ;
  ./configure --prefix=${PREFIX}/x86_64 --enable-static=no --with-cpu=x86-64 CFLAGS="-O3 -g0 -DNDEBUG -arch x86_64" LDFLAGS="-arch x86_64" ;
  make install
)
