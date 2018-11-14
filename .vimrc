"プラグイン設定 {{{
set nocompatible
filetype off

"Windows用でも, .vimを読むように設定上書き
set rtp+=~/.vim

"set rtp+=~/.vim/bundle/vim-latex
set rtp+=~/.vim/bundle/lightline.vim
set rtp+=~/.vim/bundle/plantuml-syntax
set rtp+=~/.vim/bundle/vimtex
set rtp+=~/.vim/bundle/vim-quickrun
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
  au FileType plantuml command! OpenUml :! start chrome % 
else
  au FileType plantuml command! OpenUml :! open -a "Google Chrome" % 
endif
"}}}


