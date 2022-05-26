lua require'lspconfig'.dartls.setup{}
lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.pylsp.setup{}

autocmd Filetype dart setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype c setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType plantuml setlocal omnifunc=syntaxcomplete#Complete
