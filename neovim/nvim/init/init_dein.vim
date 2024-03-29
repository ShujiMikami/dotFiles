" dein.vim

if &compatible

  set nocompatible

endif

" Add the dein installation directory into runtimepath

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim



if dein#load_state('~/.cache/dein')

  call dein#begin('~/.cache/dein')



  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')


  if !has('nvim')

    call dein#add('roxma/nvim-yarp')

    call dein#add('roxma/vim-hug-neovim-rpc')

  endif

  " ここに使いたいプラグインを書いておく
  "

  call dein#add('Shougo/deoplete.nvim')

  call dein#add('tomasr/molokai')

  call dein#add('dracula/vim')

  call dein#add('vim-airline/vim-airline')

  call dein#add('vim-airline/vim-airline-themes')

  if has("mac")
    call dein#add('autozimu/LanguageClient-neovim', {
    	\ 'rev': 'next',
      \ 'build': 'bash install.sh'
    	\ })
  elseif has("unix")
    call dein#add('autozimu/LanguageClient-neovim', {
    	\ 'rev': 'next',
      \ 'build': 'bash install.sh'
    	\ })
  elseif has("win64")
    call dein#add('autozimu/LanguageClient-neovim', {
    	\ 'rev': 'next',
      \ 'build': 'powershell -executionpolicy bypass -File install.ps1'
    	\ })
  endif

  call dein#add('tyru/open-browser.vim')

  call dein#add('aklt/plantuml-syntax')

  call dein#add('lervag/vimtex')

  call dein#add('preservim/nerdtree')

  call dein#add('thinca/vim-quickrun')

  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  call dein#add('ncm2/float-preview.nvim.git')

  call dein#add('jistr/vim-nerdtree-tabs')

  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['plantuml', 'markdown', 'pandoc.markdown', 'rmd'],
					\ 'build': 'cmd -c "cd app & yarn install"' })


  call dein#add('vim-scripts/DoxygenToolkit.vim')

  call dein#add('dart-lang/dart-vim-plugin')

"  call dein#add('neoclide/coc.nvim', {'branch': 'release'})
  call dein#add('neovim/nvim-lspconfig')

  call dein#add('williamboman/nvim-lsp-installer')

  call dein#add('hrsh7th/nvim-cmp')

  call dein#add('hrsh7th/cmp-nvim-lsp')

  call dein#add('hrsh7th/cmp-vsnip')

  call dein#add('hrsh7th/cmp-buffer')

  call dein#add('hrsh7th/vim-vsnip')

  call dein#add('hrsh7th/cmp-omni')

  call dein#add('akinsho/flutter-tools.nvim')

  call dein#add('onsails/lspkind.nvim')

  call dein#add('folke/trouble.nvim')

  call dein#add('nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'})

  call dein#add('kyazdani42/nvim-web-devicons')


  "プラグインここまで

  call dein#end()

  call dein#save_state()

endif

