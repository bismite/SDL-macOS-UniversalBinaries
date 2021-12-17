# SDL-macOS-UniversalBinaries

SDL-related libraries in macOS universal binary (Fat Binary) format
for arm64 and x86_64, including SDL2, SDL2-image, SDL2-mixer, and mpg123.

# Change log
## 1.2 (2021-12-17)
- SDL2-2.0.18
- SDL2_image-2.0.5
- SDL2_mixer-2.0.4
  - mpg123 load dynamically.
- mpg123-1.29.3
## 1.1 (2021-09-21)
- SDL2-2.0.16
- SDL2_image-2.0.5
- SDL2_mixer-2.0.4
- mpg123-1.29.0

# Usage
add rpath to executable: `install_name_tool -add_rpath @executable_path/../path/to/lib foobar.exe`
