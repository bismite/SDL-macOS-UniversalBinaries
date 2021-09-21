#!/bin/bash

for url in \
  https://www.libsdl.org/release/SDL2-2.0.16.tar.gz \
  https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.tar.gz \
  https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.4.tar.gz \
  http://mpg123.de/download/mpg123-1.29.0.tar.bz2
do
  echo $url
  curl "-JOL#" -C - $url
done
