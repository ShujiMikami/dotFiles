"プラグイン設定 {{{
set nocompatible
filetype off

"Windows用でも, .vimを読むように設定上書き
set rtp+=~/.vim

set rtp+=~/.vim/bundle/lightline.vim
set rtp+=~/.vim/bundle/plantuml-syntax
set rtp+=~/.vim/bundle/vimtex
set rtp+=~/.vim/bundle/vim-quickrun
set rtp+=~/.vim/bundle/vimproc.vim
set rtp+=~/.vim/bundle/neocomplete.vim
set rtp+=~/.vim/bundle/jedi-vim
set rtp+=~/.vim/bundle/vim-fugitive
set rtp+=~/.vim/bundle/gitv
set rtp+=~/.vim/bundle/vim-clang
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

"vim-quickrun {{{
let g:quickrun_config = get(g:, 'quickrun_config', {})

let g:quickrun_config._ = {
\   'runner'    : 'vimproc',
\   'runner/vimproc/updatetime' : 60,
\   'outputter' : 'error',
\   'outputter/error/success' : 'buffer',
\   'outputter/error/error'   : 'quickfix',
\   'outputter/buffer/split'  : ':rightbelow 8sp',
\   'outputter/buffer/close_on_empty' : 1,
\}
"}}}

"neocomplete {{{
  "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  
  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }
  
  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
  
  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()
  
  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
  
  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1
  
  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
  
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType python setlocal omnifunc=jedi#completions
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  
  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif

  " For latexomni.vim setting
  let g:neocomplete#sources#omni#input_patterns.tex =
        \ g:vimtex#re#neocomplete
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
 " let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  
  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif


  " For pythonomni setting
  let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
  let g:neocomplete#force_overwrite_completefunc = 1
  let g:neocomplete#force_omni_input_patterns.c =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
  let g:neocomplete#force_omni_input_patterns.cpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"
" 補完候補が表示されている場合は確定。そうでない場合は改行
  inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"

"}}}

"jedi{{{
  let g:jedi#completions_enabled = 0
  let g:jedi#auto_vim_configuration = 0
"}}}

"python{{{
if has("win32") || has("win64")
  py3 import os; sys.executable=os.path.join(sys.prefix, 'python.exe')
endif
"}}}
"
" 'justmao945/vim-clang' {{{

" default 'longest' can not work with neocomplete


let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '
  \ -std=c++1z 
  \ -stdlib=libc++ 
  \ -pedantic-errors
  \ '

" }}}
