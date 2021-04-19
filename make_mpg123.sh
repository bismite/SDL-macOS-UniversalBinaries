#!/bin/bash

mkdir -p build/include build/lib

lipo -create build/arm64/lib/libmpg123.0.dylib build/x86_64/lib/libmpg123.0.dylib -output build/lib/libmpg123.0.dylib
(cd build/lib/ ; ln -s libmpg123.0.dylib libmpg123.dylib)

cp build/arm64/include/mpg123.h build/include/
cp build/arm64/include/fmt123.h build/include/

mkdir -p build/licenses
cp /tmp/mpg123-1.26.5-x86_64/COPYING build/licenses/mpg123-1.26.5-COPYING.txt
