source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

colorscheme molokai
if has("win32") || has("win64")
  set guifont=Osaka－等幅:h12:cSHIFTJIS:qDRAFT
else
  set guifont=Osaka:h12
endif
