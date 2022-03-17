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

set OP=--keep --archive-dest d:\qt_archives --outputdir d:\qt

:: Qt Creator
aqt install-tool %OP% windows desktop tools_qtcreator qt.tools.qtcreator

:: GCC compiler versions
aqt install-tool %OP% windows desktop tools_mingw     qt.tools.win64_mingw730
aqt install-tool %OP% windows desktop tools_mingw     qt.tools.win64_mingw810

:: Prebuilt Qt libs with tools (qmake, uic, moc)
aqt install-qt %OP% windows desktop 5.14.2 win64_mingw73
aqt install-qt %OP% windows desktop 5.15.2 win64_mingw81
aqt install-qt %OP% windows desktop 6.2.3 win64_mingw -m qtmultimedia qtserialport qtimageformats qt5compat

:: Qt source files
aqt install-src %OP% windows 5.14.2
aqt install-src %OP% windows 5.15.2
aqt install-src %OP% windows 6.2.3

:: Qt help files
aqt install-doc %OP% windows 5.14.2
aqt install-doc %OP% windows 5.15.2
aqt install-doc %OP% windows 6.2.3

:: ms vc++ runtime
aqt install-tool %OP% windows desktop tools_vcredist qt.tools.vcredist_msvc2019_x64
aqt install-tool %OP% windows desktop tools_vcredist qt.tools.vcredist_msvc2017_x64
aqt install-tool %OP% windows desktop tools_vcredist qt.tools.vcredist_msvc2015_x64
aqt install-tool %OP% windows desktop tools_vcredist qt.tools.vcredist_msvc2013_x64
aqt install-tool %OP% windows desktop tools_vcredist qt.tools.vcredist_64

