#!/bin/sh

# compile
clang -c sample.c -I ../build/include -I ../build/include/SDL2

# shared link
clang sample.o -o sample.exe -L ../build/lib -lSDL2 -lSDL2_mixer -lSDL2_image
install_name_tool -add_rpath @executable_path/../build/lib sample.exe

# static link
clang sample.o ../build/lib/libSDL2.a ../build/lib/libSDL2_mixer.a ../build/lib/libSDL2_image.a -o sample-static.exe \
  -lm -liconv -Wl,-framework,CoreAudio -Wl,-framework,AudioToolbox -Wl,-weak_framework,CoreHaptics -Wl,-weak_framework,GameController -Wl,-framework,ForceFeedback -lobjc -Wl,-framework,CoreVideo -Wl,-framework,Cocoa -Wl,-framework,Carbon -Wl,-framework,IOKit -Wl,-weak_framework,QuartzCore -Wl,-weak_framework,Metal
install_name_tool -add_rpath @executable_path/../build/lib sample-static.exe
