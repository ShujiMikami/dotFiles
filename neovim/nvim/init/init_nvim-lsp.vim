lua require'lspconfig'.dartls.setup{}
lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.pylsp.setup{}

nnoremap <SPACE>d :lua vim.lsp.buf.declaration()<CR>
nnoremap <SPACE>D :lua vim.lsp.buf.definition()<CR>
nnoremap <SPACE>i :lua vim.lsp.buf.implementation()<CR>
nnoremap <SPACE>h :lua vim.lsp.buf.hover()<CR>
nnoremap <SPACE>s :lua vim.lsp.buf.signature_help()<CR>
nnoremap <SPACE>r :lua vim.lsp.buf.references()<CR>
nnoremap <SPACE>F :lua vim.lsp.buf.formatting()<CR>

"autocmd Filetype dart setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd Filetype c setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd Filetype cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType plantuml setlocal omnifunc=syntaxcomplete#Complete
