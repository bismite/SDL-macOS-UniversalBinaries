#!/bin/bash

SDL2=SDL2-2.0.18
PREFIX=$(pwd)/build
echo ${PREFIX}

rm -rf /tmp/${SDL2}
tar xf ${SDL2}.tar.gz -C /tmp
(
  cd /tmp/${SDL2} ;
  ./configure --prefix=${PREFIX} --enable-static=yes CFLAGS="-O3 -g0 -DNDEBUG -arch arm64 -arch x86_64" LDFLAGS="-arch arm64 -arch x86_64" ;
  make install
)
rm build/include/SDL2/SDL_test*.h

mkdir -p build/licenses
cp /tmp/${SDL2}/LICENSE.txt build/licenses/${SDL2}-LICENSE.txt
