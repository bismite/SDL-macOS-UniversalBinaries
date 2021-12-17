#!/bin/bash

# init
mkdir build
PREFIX=$(pwd)/build
echo ${PREFIX}
MPG123=mpg123-1.29.3

# arm64
rm -rf /tmp/${MPG123}-arm64
tar xf ${MPG123}.tar.bz2 -C /tmp
mv /tmp/${MPG123} /tmp/${MPG123}-arm64
(
  cd /tmp/${MPG123}-arm64 ;
  ./configure --prefix=${PREFIX}/arm64 --enable-static=no --with-cpu=aarch64 --host=x86_64-apple-darwin --build=aarch64 CFLAGS="-O3 -g0 -DNDEBUG -arch arm64" LDFLAGS="-arch arm64" ;
  make install
)

# x86_64
rm -rf /tmp/${MPG123}-x86_64
tar xf ${MPG123}.tar.bz2 -C /tmp
mv /tmp/${MPG123} /tmp/${MPG123}-x86_64
(
  cd /tmp/${MPG123}-x86_64 ;
  ./configure --prefix=${PREFIX}/x86_64 --enable-static=no --with-cpu=x86-64 CFLAGS="-O3 -g0 -DNDEBUG -arch x86_64" LDFLAGS="-arch x86_64" ;
  make install
)

# packing
mkdir -p build/include build/lib
lipo -create build/arm64/lib/libmpg123.0.dylib build/x86_64/lib/libmpg123.0.dylib -output build/lib/libmpg123.0.dylib
(cd build/lib/ ; ln -s libmpg123.0.dylib libmpg123.dylib)
cp build/arm64/include/mpg123.h build/include/
cp build/arm64/include/fmt123.h build/include/
mkdir -p build/licenses
cp /tmp/${MPG123}-x86_64/COPYING build/licenses/${MPG123}-COPYING.txt
