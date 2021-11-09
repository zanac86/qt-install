# Форматирование исходных текстов C/C++

## Плагин форматирования в QtCreator

Qt Creator содержит в своем составе плагин для форматирования исходных текстов.

В диалоге *Help* → *About Plugins...* (*Справка* → *О модулях*) включить плагин `ClangFormat`, если он был выключен и нажать кнопку *Закрыть*.

В диалоге *Tools* → *Options* → *C++* → *Code Style* (*Инструменты* → *Параметры...* → *С++* → *Стиль кода*) нужно отметить галочки:

* [x] Format instead of indetnting (Форматировать вместо выполнения отступа)
* [x] Format while typing (Форматировать при наборе кода)
* [x] Format edited code on file save (Форматировать измененный код при сохранении)
* [x] Override Clang Format configuration file (Переопределить файл настроек Clang Format)

Закрыть Qt Creator. В директории настроек Qt Creator будет создан файл параметров форматирования.

```
C:\Users\vb\AppData\Roaming\QtProject\qtcreator\.clang-format
```

Заменить содержимое файла .clang-format в директории настроек Qt Creator в профиле пользователя на следущие параметры.

```
BasedOnStyle: WebKit
AlignAfterOpenBracket: Align
AlignConsecutiveAssignments: true
AlignOperands: true
AllowShortFunctionsOnASingleLine: All
BinPackArguments: false
BraceWrapping:
  AfterClass: true
  AfterFunction: true
  AfterNamespace: true
  AfterStruct: true
  AfterUnion: true
  BeforeElse: true
BreakBeforeBraces: Allman
Cpp11BracedListStyle: true
IndentCaseLabels: true
IndentWidth: 4
MaxEmptyLinesToKeep: 2
NamespaceIndentation: All
SortIncludes: false
SpaceAfterTemplateKeyword: true
UseTab: Never
```

## Файл настроек QtCreator

В профиле `C:\Users\<Имя пользователя>\AppData\Roaming\QtProject` лежит `QtCreator.ini`.

Галочки из диалога настроек можно включить в файле. QtCreator должен быть закрыть перед редактированием.

```
[ClangFormat]
ClangFormat.FormatCodeInsteadOfIndent=true
ClangFormat.FormatWhileTyping=true
ClangFormat.FormatCodeOnSave=true
ClangFormat.OverrideFile=true
```
