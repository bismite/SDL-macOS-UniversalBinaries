#!/bin/bash

PREFIX=$(pwd)/build
echo ${PREFIX}

# search path
export C_INCLUDE_PATH=${PREFIX}/include
export LIBRARY_PATH=${PREFIX}/lib
export PATH=$PATH:${PREFIX}/bin

DISABLES="--disable-music-mod --disable-music-midi --disable-music-ogg --disable-music-flac --disable-music-opus"

rm -rf /tmp/SDL2_mixer-2.0.4
tar zxf SDL2_mixer-2.0.4.tar.gz -C /tmp
(
  cd /tmp/SDL2_mixer-2.0.4 ;
  ./configure --prefix=${PREFIX} --enable-static=yes ${DISABLES} CFLAGS="-O3 -g0 -DNDEBUG -arch arm64 -arch x86_64" LDFLAGS="-arch arm64 -arch x86_64 -L${PREFIX}/lib" ;
  make install
)

mkdir -p build/licenses
cp /tmp/SDL2_mixer-2.0.4/COPYING.txt build/licenses/SDL2_mixer-2.0.4-COPYING.txt
