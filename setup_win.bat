@echo off

rem カレントディレクトリを文字列で取得
set CURDIR=%~dp0

rem GithubからVundleをダウンロード
rem git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
rem GithubからMolokaiをダウンロード
rem git clone https://github.com/tomasr/molokai

rem ダウンロードしたMolokaiをColorsにコピー
rem mkdir .vim\colors
rem mklink .vim\colors\molokai.vim molokai\colors\molokai.vim

rem .vimrcを.vimrcの名前でHOMEにシンボリックリンク
mklink %HOMEPATH%\.vimrc %CURDIR%.vimrc

rem .gvimrcを.gvimrcの名前でHOMEにシンボリックリンク
mklink %HOMEPATH%\.gvimrc %CURDIR%.gvimrc

rem .vimをvimfilesの名前でHOMEにシンボリックリンク
mklink /D %HOMEPATH%\.vim %CURDIR%.vim

rem .latexmkrcをHOMEにシンボリックリンク
mklink %HOMEPATH%\.latexmkrc %CURDIR%.latexmkrc