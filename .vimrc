"プラグイン設定 {{{
set nocompatible
filetype off

"Windows用でも, .vimを読むように設定上書き
set rtp+=~/.vim

set rtp+=~/.vim/bundle/vim-latex
set rtp+=~/.vim/bundle/lightline.vim
set rtp+=~/.vim/bundle/plantuml-syntax

"}}}

filetype plugin indent on

"基本設定-{{{
"カラースキームをmolokaiにする
colorscheme molokai

"行番号表示
set number

"日本語設定
set encoding=utf-8
set fileencodings=iso-2022.jp,sjis,euc-jp,utf-8

"強調表示有効
syntax on

"自動インデント有効
set autoindent

"タブの移動量2文字
set tabstop=2

"移動量2文字
"
set shiftwidth=2

"C言語スタイルのインデント有効
set cindent

"展開タブ有効
set expandtab

"ルーラ有効
set ruler

"不可視文字を表示
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<

"インクリメンタルサーチ
set incsearch

"検索結果をハイライト
set hlsearch

"検索がファイル末尾まで進んだらファイル先頭から再検索
set wrapscan

"検索で大文字小文字は無視
set ignorecase

"ウインドウ幅より長い行は折り返す
set wrap

"対応括弧をハイライト表示
set showmatch

"カーソル移動で行をまたいで移動
set whichwrap=h,l

"保存されていないファイルがあっても別のファイルを開ける
set hidden

"コマンド履歴を2000
set history=2000

"ステータスラインを表示
set laststatus=2

"カーソル行をハイライト
set cursorline

"vimを256モードで動作
set t_Co=256

"マーカー文字列で折りたたみ埋め込み
set foldmethod=marker

"初回起動時の場所をユーザーホームとする"
cd ~
"}}}

"plantuml-syntax {{{
if has("win32") || has("win64")
  au FileType plantuml command! OpenUml :!start -a "Google Chrome" % 
else
  au FileType plantuml command! OpenUml :!open -a "Google Chrome" % 
endif
"}}}

"" Vim-LaTeX{{{

filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'luajitlatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_pdf = 'xdg-open'
"let g:Tex_ViewRule_pdf = 'evince'
"let g:Tex_ViewRule_pdf = 'okular --unique'
"let g:Tex_ViewRule_pdf = 'zathura -x "vim --servername synctex -n --remote-silent +\%{line} \%{input}"'
"let g:Tex_ViewRule_pdf = 'qpdfview --unique'
"let g:Tex_ViewRule_pdf = 'texworks'
"let g:Tex_ViewRule_pdf = 'mupdf'
"let g:Tex_ViewRule_pdf = 'firefox -new-window'
"let g:Tex_ViewRule_pdf = 'chromium --new-window'
"}}}

