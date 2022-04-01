# msys2

## Base

https://www.msys2.org/wiki/MSYS2-installation/

pacman -Su

pacman -S git wget p7zip base-devel
pacman -S base-devel mingw-w64-x86_64-toolchain
нажать Enter - устновить все

## STM32

pacman -S mingw-w64-x86_64-arm-none-eabi-toolchain
pacman -S mingw-w64-x86_64-arm-none-eabi-gcc
pacman -S mingw-w64-x86_64-arm-none-eabi-gdb
pacman -S mingw-w64-x86_64-arm-none-eabi-binutils
pacman -S mingw-w64-x86_64-arm-none-eabi-newlib

## Qt

pacman -S mingw-w64-clang-x86_64-qt5

pacman -S mingw-w64-clang-x86_64-qt5-static

