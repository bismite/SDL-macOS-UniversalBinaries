#!/bin/bash

PREFIX=$(pwd)/build
install_name_tool -change ${PREFIX}/lib/libSDL2-2.0.0.dylib @rpath/libSDL2-2.0.0.dylib build/lib/libSDL2_image-2.0.0.dylib
install_name_tool -change ${PREFIX}/lib/libSDL2-2.0.0.dylib @rpath/libSDL2-2.0.0.dylib build/lib/libSDL2_mixer-2.0.0.dylib

install_name_tool -id @rpath/libSDL2-2.0.0.dylib ${PREFIX}/lib/libSDL2-2.0.0.dylib
install_name_tool -id @rpath/libSDL2_image-2.0.0.dylib ${PREFIX}/lib/libSDL2_image-2.0.0.dylib
install_name_tool -id @rpath/libSDL2_mixer-2.0.0.dylib ${PREFIX}/lib/libSDL2_mixer-2.0.0.dylib
install_name_tool -id @rpath/libmpg123.0.dylib ${PREFIX}/lib/libmpg123.0.dylib
