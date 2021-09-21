#!/bin/bash

PREFIX=$(pwd)/build
echo ${PREFIX}

rm -rf /tmp/SDL2-2.0.16
tar zxf SDL2-2.0.16.tar.gz -C /tmp
(
  cd /tmp/SDL2-2.0.16 ;
  ./configure --prefix=${PREFIX} --enable-static=no CFLAGS="-O3 -g0 -DNDEBUG -arch arm64 -arch x86_64" LDFLAGS="-arch arm64 -arch x86_64" ;
  make install
)
rm build/include/SDL2/SDL_test*.h

mkdir -p build/licenses
cp /tmp/SDL2-2.0.16/LICENSE.txt build/licenses/SDL2-2.0.16-LICENSE.txt
