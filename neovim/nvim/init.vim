let g:python_host_prog = expand('$PYTHON27_DIR/python')
let g:python3_host_prog = expand('$PYTHON37_DIR/python')

" dein.vim

if &compatible

  set nocompatible

endif

" Add the dein installation directory into runtimepath

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim



if dein#load_state('~/.cache/dein')

  call dein#begin('~/.cache/dein')



  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/deoplete.nvim')

  if !has('nvim')

    call dein#add('roxma/nvim-yarp')

    call dein#add('roxma/vim-hug-neovim-rpc')

  endif

  " ここに使いたいプラグインを書いておく

  call dein#add('tomasr/molokai')

  call dein#add('dracula/vim')

  call dein#add('vim-airline/vim-airline')

  call dein#add('vim-airline/vim-airline-themes')

  call dein#add('autozimu/LanguageClient-neovim', {
  	\ 'rev': 'next',
  	\ 'build': 'powershell -executionpolicy bypass -File install.ps1',
  	\ })



  call dein#end()

  call dein#save_state()

endif



filetype plugin indent on

syntax enable

let g:LanguageClient_serverCommands = {
	\ 'c':['clangd'],
	\ 'cpp':['clangd']
	\}
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 0

set completefunc=LanguageClient#complete

nnoremap <SPACE>h :call LanguageClient#textDocument_hover()<CR>
nnoremap <SPACE>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <SPACE>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <SPACE>f :call LanguageClient#textDocument_formatting()<CR>

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_reflesh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000

