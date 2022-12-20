"lua require'lspconfig'.dartls.setup{}
"lua require'lspconfig'.clangd.setup{}
"lua require'lspconfig'.pylsp.setup{}

lua << EOF
  -- Useful functions {{{
  --Check file exists
  function io.file_exists(path)
    local fh = io.open(path, "rb")
    if fh then fh:close() end
    return fh ~= nil
  end
  --Check file include phrase
  function io.file_include(filepath, phrase)
    f = io.open(filepath)
    local result = false
    for line in f:lines() do
      if string.find(line, 'platform = espressif32') then
        result = true
      end
    end
    return result
  end
  --}}}

  -- Functions {{{
  --Check workspace is platformio-espressif32framework
  function detect_platformio_espressif32(workspace_path)
    local result = false
    if io.file_exists(workspace_path..'/platformio.ini') then
      result = io.file_include(workspace_path..'/platformio.ini', 'platform = espressif32')
    end
    return result
  end

  ---}}}

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['dartls'].setup {
    capabilities = capabilities
  }

  -- Callback func of c file attached
  local on_attach_c = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', '<SPACE>d', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<SPACE>i', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<SPACE>h', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<SPACE>s', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<SPACE>r', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<SPACE>F', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<SPACE>R', vim.lsp.buf.rename, bufopts)

    print(#vim.lsp.buf.list_workspace_folders())
    print(vim.lsp.buf.list_workspace_folders()[1])

    if detect_platformio_espressif32(vim.lsp.buf.list_workspace_folders()[1]) then
      require'lspconfig'.clangd.setup {
        cmd = { "/Users/shuji/Downloads/esp-clang/bin/clangd", 
                "-background-index",
                "--query-driver=/Users/shuji/.platformio/packages/*/bin/*"},
        capabilities = capabilities,
        on_attach = on_attach_c
      }
      print("esp32platform")
    else
      require'lspconfig'.clangd.setup {
--        cmd = { "/Users/shuji/Downloads/esp-clang/bin/clangd", 
--                "-background-index",
--                "--query-driver=/Users/shuji/.platformio/packages/*/bin/*"},
        capabilities = capabilities,
        on_attach = on_attach_c
      }
      print("not esp32platform")
    end
  end

  require'lspconfig'.clangd.setup {
--    cmd = { "/Users/shuji/Downloads/esp-clang/bin/clangd", 
--            "-background-index",
--            "--query-driver=/Users/shuji/.platformio/packages/*/bin/*"},
    capabilities = capabilities,
    on_attach = on_attach_c
  }
EOF

"nnoremap <SPACE>d :lua vim.lsp.buf.declaration()<CR>
"nnoremap <SPACE>D :lua vim.lsp.buf.definition()<CR>
"nnoremap <SPACE>i :lua vim.lsp.buf.implementation()<CR>
"nnoremap <SPACE>h :lua vim.lsp.buf.hover()<CR>
"nnoremap <SPACE>s :lua vim.lsp.buf.signature_help()<CR>
"nnoremap <SPACE>r :lua vim.lsp.buf.references()<CR>
"nnoremap <SPACE>F :lua vim.lsp.buf.formatting()<CR>

"autocmd Filetype dart setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd Filetype c setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd Filetype cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType plantuml setlocal omnifunc=syntaxcomplete#Complete
