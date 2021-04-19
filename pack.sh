#!/bin/bash

mkdir -p SDL-macOS-UniversalBinaries/lib SDL-macOS-UniversalBinaries/include
cp -R build/include/SDL2 SDL-macOS-UniversalBinaries/include/

for libname in libSDL2-2.0.0.dylib libSDL2.dylib \
           libSDL2_image-2.0.0.dylib libSDL2_image.dylib \
           libSDL2_mixer-2.0.0.dylib libSDL2_mixer.dylib \
           libmpg123.0.dylib libmpg123.dylib
do
  cp -R build/lib/${libname} SDL-macOS-UniversalBinaries/lib/
done

cp -R build/licenses SDL-macOS-UniversalBinaries/

tar czf SDL-macOS-UniversalBinaries.tgz SDL-macOS-UniversalBinaries
