@echo off

rem カレントディレクトリを文字列で取得
set CURDIR=%~dp0

rem nvimディレクトリをnvimの名前でHOME\AppData\Localにシンボリックリンク
mklink /D %HOMEPATH%\AppData\Local\nvim %CURDIR%neovim\nvim

rem .latexmkrcをHOMEにシンボリックリンク
mklink %HOMEPATH%\.latexmkrc %CURDIR%.latexmkrc