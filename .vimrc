"プラグイン設定 {{{
set nocompatible
filetype off

"Windows用でも, .vimを読むように設定上書き
set rtp+=~/.vim

set rtp+=~/.vim/bundle/lightline.vim
set rtp+=~/.vim/bundle/plantuml-syntax
set rtp+=~/.vim/bundle/vimtex
"set rtp+=~/.vim/bundle/vim-quickrun
"set rtp+=~/.vim/bundle/vimproc.vim
"set rtp+=~/.vim/bundle/neocomplete.vim
"set rtp+=~/.vim/bundle/jedi-vim
set rtp+=~/.vim/bundle/vim-fugitive
set rtp+=~/.vim/bundle/gitv
"set rtp+=~/.vim/bundle/vim-clang
"set rtp+=~/.vim/bundle/neoinclude.vim
"set rtp+=~/.vim/bundle/neco-syntax
set rtp+=~/.vim/bundle/vim-lsp
set rtp+=~/.vim/bundle/async.vim
"}}}

"共通設定-{{{
"ファイルタイプ検出, インデックス有効
filetype plugin indent on

"TABでのメニュー補完ON
set wildmenu

"オムニ補完ON
set omnifunc=syntaxcomplete#Complete

"カラースキームをmolokaiにする
colorscheme molokai

"行番号表示
set number

"日本語設定
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022.jp,euc-jp

"強調表示有効
syntax on

"自動インデント有効
set autoindent

"タブの移動量2文字
set tabstop=2

"移動量2文字
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

"キーリマップ{{{
"ウインドウ移動をCTRLのみで
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap > <C-w>>
nnoremap < <C-w><
nnoremap + <C-w>+
nnoremap - <C-w>-
"}}}

"plantuml-syntax {{{
if has("win32") || has("win64")
  au FileType plantuml command! OpenUml :! start chrome % 
else
  au FileType plantuml command! OpenUml :! open -a "Google Chrome" % 
endif
"}}}

"vimtex {{{
"texのファイルタイプをlatexで認識
let g:tex_flavor = "latex"
"}}}


if executable('clangd')
  augroup lsp_clangd
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'clangd',
          \ 'cmd': {server_info->['clangd']},
          \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
          \ })
    autocmd FileType c setlocal omnifunc=lsp#complete
    autocmd FileType cpp setlocal omnifunc=lsp#complete
    autocmd FileType objc setlocal omnifunc=lsp#complete
    autocmd FileType objcpp setlocal omnifunc=lsp#complete
  augroup end
endif


"python{{{
if has("win32") || has("win64")
  py3 import os; sys.executable=os.path.join(sys.prefix, 'python.exe')
endif
"}}}
"
