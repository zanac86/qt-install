:: Using Another unofficial Qt Installer
::
:: https://github.com/miurahr/aqtinstall/
:: https://aqtinstall.readthedocs.io/en/latest/getting_started.html
::
:: Install to specific path "aqt install-qt -O f:\qt5 windows ..."
::
:: Qt online repositories
::
:: https://download.qt.io/online/qtsdkrepository/windows_x86/desktop/tools_mingw/
:: https://download.qt.io/online/qtsdkrepository/windows_x86/desktop/tools_qtcreator/qt.tools.qtcreator/
:: https://download.qt.io/online/qtsdkrepository/windows_x86/desktop/tools_vcredist/
:: Qt Creator needs msvcrt 14.0 == 2015
:: Microsoft Visual C++ run-time dlls for Qt Creator

::aqt list-qt windows desktop
::aqt list-qt windows desktop --modules 6.2.0 win64_mingw81
::aqt list-tool windows desktop
::aqt list-tool windows desktop tools_mingw -l
::aqt list-tool windows desktop tools_qtcreator -l
::aqt list-tool windows desktop tools_vcredist -l

aqt install-tool windows desktop tools_vcredist  qt.tools.vcredist_msvc2019_x64
aqt install-tool windows desktop tools_vcredist  qt.tools.vcredist_msvc2017_x64
aqt install-tool windows desktop tools_vcredist  qt.tools.vcredist_msvc2015_x64
aqt install-tool windows desktop tools_vcredist  qt.tools.vcredist_msvc2013_x64

:: Qt Creator
aqt install-tool windows desktop tools_qtcreator qt.tools.qtcreator

:: GCC compiler versions
aqt install-tool windows desktop tools_mingw     qt.tools.win64_mingw730
aqt install-tool windows desktop tools_mingw     qt.tools.win64_mingw810

:: Prebuilt Qt libs with tools (qmake, uic, moc)
aqt install-qt windows desktop 5.14.2 win64_mingw73
aqt install-qt windows desktop 5.15.2 win64_mingw81
aqt install-qt windows desktop 6.2.0 win64_mingw81 -m qtmultimedia qtserialport qtimageformats qt5compat

:: Qt source files
aqt install-src windows desktop 5.15.2
aqt install-src windows desktop 6.2.0

:: Qt help files
aqt install-doc windows desktop 5.15.2
aqt install-doc windows desktop 6.2.0
