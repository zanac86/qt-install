# msys2

## Base

https://www.msys2.org/wiki/MSYS2-installation/

pacman -Syu

pacman -S git wget p7zip base-devel
pacman -S mingw-w64-x86_64-cmake
pacman -S --needed base-devel mingw-w64-x86_64-toolchain
нажать Enter - установить все

## STM32

pacman -S mingw-w64-x86_64-arm-none-eabi-toolchain
pacman -S mingw-w64-x86_64-arm-none-eabi-gcc
pacman -S mingw-w64-x86_64-arm-none-eabi-gdb
pacman -S mingw-w64-x86_64-arm-none-eabi-binutils
pacman -S mingw-w64-x86_64-arm-none-eabi-newlib

## Qt mingw

pacman -S mingw-w64-x86_64-qt5
pacman -S mingw-w64-x86_64-qt5-static

https://packages.msys2.org/search?q=qt6

If you need to use qt5-static with libraries located in /mingw64 
you should add them to the .pro file as LIBS += -L/mingw64/lib -lsomelib

## Qt clang

pacman -S mingw-w64-x86_64-clang
pacman -S mingw-w64-clang-x86_64-qt5
pacman -S mingw-w64-clang-x86_64-qt5-static

## Библиотеки

pacman -S mingw-w64-x86_64-pugixml
pacman -S mingw-w64-x86_64-fmt

## pacman

искать пакет
pacman -Ss имя пакета

удалить
pacman -R имя пакета

## Qt for Qt Creator

D:\msys64\mingw64\bin\gdb.exe
D:\msys64\mingw64\bin\g++.exe
D:\msys64\mingw64\bin\gcc.exe

D:\msys64\mingw64\qt5-static\bin\qmake.exe

