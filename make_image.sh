#!/bin/bash

PREFIX=$(pwd)/build
echo ${PREFIX}

export PATH=$PATH:${PREFIX}/bin

rm -rf /tmp/SDL2_image-2.0.5
tar zxf SDL2_image-2.0.5.tar.gz -C /tmp
(
  cd /tmp/SDL2_image-2.0.5 ;
  ./configure --prefix=${PREFIX} --enable-static=yes CFLAGS="-O3 -g0 -DNDEBUG -arch arm64 -arch x86_64" LDFLAGS="-arch arm64 -arch x86_64" ;
  make install
)

mkdir -p build/licenses
cp /tmp/SDL2_image-2.0.5/COPYING.txt build/licenses/SDL2_image-2.0.5-COPYING.txt
