"pythonパス定義{{{
if has('win32')||has('win64')
  let g:python_host_prog = $HOME . '/dotFiles/neovim/nvim-python2/.venv/Scripts/python'
  let g:python3_host_prog = $HOME . '/dotFiles/neovim/nvim-python3/.venv/Scripts/python'
else
  let g:python_host_prog = $HOME . '/.cache/nvim-python2/.venv/bin/python'
  let g:python3_host_prog = $HOME . '/.cache/nvim-python3/.venv/bin/python'
endif
"}}}
"
"カラースキーム{{{
  "ここで指定しておかないと, airlineのthemeを上書きしてしまう
  colorscheme molokai
"}}}

"プラグイン用ファイル読み込み{{{
  runtime init/init_dein.vim
"  runtime init/init_LanguageClient.vim
  runtime init/init_nvim-lsp.vim
"  runtime init/init_lspkind-nvim.vim
"  runtime init/init_deoplete.vim
  runtime init/init_nvim-cmp.vim
  runtime init/init_plantuml-syntax.vim
  runtime init/init_vimtex.vim
  runtime init/init_vim-airline-theme.vim
  runtime init/init_vim-airline.vim
  runtime init/init_nerdtree.vim
  runtime init/init_vim-quickrun.vim
  runtime init/tex_quickrun.vim
  runtime init/init_markdown_previewer.vim
"}}}

"Termdebug{{{
packadd termdebug
let g:termdebugger = "arm-none-eabi-gdb"
let g:termdebug_popup = 0
let g:termdebug_wide = 163
"}}}

let g:mkdp_command_for_global = 1

"キーリマップ{{{
  runtime init/init_keyremap.vim
"}}}

"共通設定{{{
  "ファイルタイプ検出
  filetype plugin indent on

  "コマンド可視化
  set showcmd
  
  "シンタックス有効
  syntax enable

  "下分割
  set splitbelow

  "TABでのメニュー補完
  set wildmenu

  "オムニ補完ON
"  set completefunc+=omnifunc

  "行番号表示
  set number

  "日本語フォント設定
  "set encoding=utf-8
  set fileencodings=utf-8,sjis,cp932,iso-2022-jp,euc-jp
  set fileformats=unix,dos,mac

  "自動インデント
  set autoindent

  "タブは2スペース
  set tabstop=2

  "移動量2文字
  set shiftwidth=2

  "C言語スタイルのインデント有効
  set cindent

  "展開タブ有効
  set expandtab

  "ルーラ
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
"  
  "ウインドウ幅より長い行は折り返す
  set wrap
"  
  "対応括弧をハイライト表示
  set showmatch
  
  "カーソル移動で行をまたいで移動
  set whichwrap=h,l
"  
  "保存されていないファイルがあっても別のファイルを開ける
  "set hidden
  
  "コマンド履歴を2000
  set history=2000
  
  "ステータスラインを表示
  set laststatus=2
  
  "カーソル行をハイライト
  set cursorline
  
  "vimを256モードで動作
  set t_Co=256

  "truecolor
  set termguicolors

  "背景色
  set background=dark
  
  "マーカー文字列で折りたたみ埋め込み
  set foldmethod=marker
  
  "初回起動時の場所をユーザーホームとする"
  cd ~

  "一つ目の候補を選択状態にする
  "set completeopt+=noinsert

  "クリップボード互換
  set clipboard+=unnamedplus

  "候補が一つでも補完表示
  set completeopt+=menuone

  set completeopt-=preview

  set mouse=a
"}}}

"ファイルタイプ別設定{{{"
autocmd FileType c setlocal foldmethod=syntax
autocmd FileType pyton setlocal foldmethod=syntax
autocmd FileType cpp setlocal foldmethod=syntax
autocmd FileType dart setlocal foldmethod=syntax
"}}}
