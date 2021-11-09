# PowerShell execution policy.
Set-StrictMode -Version 3

# Main code
function Main
{
    $Qt = "5.15.2"
    $Qq = "d:\Qt5"
    $QtBaseDir = "$Qq\Static"
    $QtStaticDir = "$QtBaseDir\$Qt-src"
    $QtVersion = "$Qt-Static"
    $MingwDir = "$Qq\Tools\mingw810_64\"
    $QtDir = "$QtBaseDir\$QtVersion"
    $QtSrcDir = "$QtStaticDir\qtbase"
    Create-Directory $QtStaticDir
    Create-Directory $QtDir

    $SrcDir = "$Qq\$Qt\Src"

    Copy-Sources $SrcDir $QtStaticDir qtbase
    Copy-Sources $SrcDir $QtStaticDir qtsvg
    Copy-Sources $SrcDir $QtStaticDir qtdoc
    Copy-Sources $SrcDir $QtStaticDir qtserialport
    Copy-Sources $SrcDir $QtStaticDir qttools
    Copy-Sources $SrcDir $QtStaticDir qtwinextras

    Patch-qmake-conf-1 "$QtSrcDir\mkspecs\win32-g++\qmake.conf"
    $env:Path = "$MingwDir\bin;$MingwDir\opt\bin;$env:SystemRoot\system32;$env:SystemRoot"
    $env:LANG = "en"
    $env:QT_INSTALL_PREFIX = $QtDir
    Push-Location $QtSrcDir
    cmd /c "configure.bat -static -release -platform win32-g++ -prefix $QtDir -qt-zlib -qt-pcre -qt-libpng -qt-libjpeg -qt-freetype -opengl desktop -qt-sqlite -sql-sqlite -no-openssl -opensource -confirm-license -no-icu -make libs -nomake tools -nomake examples -nomake tests -no-compile-examples -no-feature-mimetype-database"
    mingw32-make -k -j8
    mingw32-make -k install
    Pop-Location
    Patch-qmake-conf-2 "$QtSrcDir\mkspecs\win32-g++\qmake.conf"

    # Build extras
    $env:Path = "$QtSrcDir\bin;$env:Path"
    Build-Extra $QtStaticDir "qtsvg"
    Build-Extra $QtStaticDir "qtdoc"
    Build-Extra $QtStaticDir "qtserialport"
    Build-Extra $QtStaticDir "qttools"
    Build-Extra $QtStaticDir "qtwinextras"

    exit 0
}

# Patch Qt's mkspecs for static build.
function Patch-qmake-conf-1([string]$File)
{
    if (-not (Select-String -Quiet -SimpleMatch -CaseSensitive "# [QT-STATIC-PATCH]" $File)) {
        Write-Output "Patching $File ..."
        Copy-Item $File "$File.orig"
        @"

# [QT-STATIC-PATCH]
QMAKE_LFLAGS += -static -static-libgcc
QMAKE_CFLAGS_RELEASE -= -O3
QMAKE_CFLAGS_RELEASE += -Os -momit-leaf-frame-pointer
DEFINES += QT_STATIC_BUILD
"@ | Out-File -Append $File -Encoding Ascii
    }
}

# Patch Qt's installed mkspecs for static build of application.
function Patch-qmake-conf-2([string]$File)
{
    @"
CONFIG += static
"@ | Out-File -Append $File -Encoding Ascii
}

# Build extra modules.
function Build-Extra ([string]$ExpandDir, [string]$ExtraName)
{
    $ExtraPath = "$ExpandDir\$ExtraName"
    Push-Location $ExtraPath
    qmake
    mingw32-make -k -j4
    mingw32-make -k install
    Pop-Location
}

# Silently create a directory.
function Create-Directory ([string]$Directory)
{
    [void] (New-Item -Path $Directory -ItemType "directory" -Force)
}

function Copy-Sources([string]$SrcDir, [string]$SrcBuildDir, [string]$Src)
{
    robocopy.exe /MIR /Z /W:5 /ETA /NDL /NFL "$SrcDir\$Src" "$SrcBuildDir\$Src"
}

#-----------------------------------------------------------------------------
# Execute main code.
#-----------------------------------------------------------------------------

. Main
