# Python

* https://www.python.org

## Install package from local file

```
pip install --no-index --no-deps --upgrade matplotlib-3.5.1-cp39-cp39-win_amd64.whl
pip install --no-index --find-links . matplotlib-3.5.1-cp39-cp39-win_amd64.whl
```

```
for %i in (*.whl) do pip install --no-index --no-deps %i
```


## Install matplotlib, PySide2, numpy

```
pip install -U pybcj pytz lizard beautifulsoup4 kiwisolver virtualenv ^
prettytable pip aqtinstall autopep8 numpy matplotlib pillow pylint ^
pyside2 setuptools pysimplegui psutil pandas pygame pyinstaller yapf ^
esptool tabulate pillow pycairo mplcairo tornado wxpython scipy astroid ^
charset-normalizer cryptography cycler fonttools isort lazy-object-proxy ^
mccabe platformdirs py7zr pycparser pycryptodomex pyinstaller-hooks-contrib ^
pip install -U pyparsing pyppmd pyzstd requests rope semantic-version ^
setuptools-scm soupsieve tomli typing-extensions urllib3 wheel wrapt pyppmd

from tabulate import tabulate
table = [['one','two','three'],['four','five','six'],['seven','eight','nine']]
print(tabulate(table, tablefmt='html'))

pip install -U prettytable

```

## Package list manage

```
pip freeze > requirement.txt
pip install -r requirement.txt
```

## Offline install

Download package with dependencies.

```
pip download pip pybcj pytz lizard beautifulsoup4 kiwisolver virtualenv prettytable autopep8 numpy pillow pylint pyside2 setuptools pysimplegui psutil pandas pygame pyinstaller yapf esptool tabulate matplotlib aqtinstall 
```

```
pip download matplotlib
```

## Manage installed packages

| Command                         | Description             |
|---------------------------------|-------------------------|
| `python -m pip install -U pip`  | Upgrade pip             |
| `pip list`                      | List installed packages |
| `pip list --outdate`            | List old packages       |
| `pip install -U <package name>` | Upgrade package         |


## Libs path

* `C:\Python39\Lib\site-packages\`
* `C:\Users\vb\AppData\Roaming\Python\Python39\site-packages`

## Download libs

https://www.lfd.uci.edu/~gohlke/pythonlibs/#matplotlib

## Reformat source file

```
yapf --in-place --recursive --style="{indent_width: 4}" *.py
```

```
autopep8 py_file --in-place
autopep8 project_dir --recursive --in-place --pep8-passes 2000 --verbose
```


