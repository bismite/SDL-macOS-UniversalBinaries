#!/bin/bash

NAME=SDL-macOS-UniversalBinaries

mkdir -p ${NAME}/lib ${NAME}/include
cp -R build/include/SDL2 ${NAME}/include/

for libname in libSDL2-2.0.0.dylib libSDL2.dylib \
           libSDL2_image-2.0.0.dylib libSDL2_image.dylib \
           libSDL2_mixer-2.0.0.dylib libSDL2_mixer.dylib \
           libmpg123.0.dylib libmpg123.dylib
do
  cp -R build/lib/${libname} ${NAME}/lib/
done

cp -R build/licenses ${NAME}/

tar czf ${NAME}.tgz ${NAME}
