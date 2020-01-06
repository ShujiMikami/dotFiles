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

  call dein#add('aklt/plantuml-syntax')

  call dein#add('lervag/vimtex')

  call dein#add('preservim/nerdtree')

  "プラグインここまで

  call dein#end()

  call dein#save_state()

endif
