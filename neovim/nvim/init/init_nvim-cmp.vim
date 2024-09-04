set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
--  require'cmp'.setup {
--    sources = {
--      { name = 'nvim_lsp_signature_help' }
--    }
--  }

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
      { name = 'omni' },
      { name = 'nvim_lsp_signature_help' }
    })
  })

  require('lspkind').init({
      -- DEPRECATED (use mode instead): enables text annotations
      --
      -- default: true
      -- with_text = true,
  
      -- defines how annotations are shown
      -- default: symbol
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      -- mode = 'symbol_text',
      mode = 'symbol_text',
  
      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = 'codicons',
  
      -- override preset symbols
      --
      -- default: {}
      symbol_map = {
        Text          = "  Text",
        Method        = "  Method",
        Function      = "  Function",
        Constructor   = "  Constructor",
        Field         = "  Field",
        Variable      = "  Variable",
        Class         = "  Class",
        Interface     = "  Interface",
        Module        = "  Module",
        Property      = "  Property",
        Unit          = "  Unit",
        Value         = "  Value",
        Enum          = "  Enum",
        Keyword       = "  Keyword",
        Snippet       = "  Snippet",
        Color         = "  Color",
        File          = "  File",
        Reference     = "  Reference",
        Folder        = "  Folder",
        EnumMember    = "  EnumMember",
        Constant      = "  Constant",
        Struct        = "  Struct",
        Event         = "  Event",
        Operator      = "  Operator",
        TypeParameter = "  TypeParameter",
      },
  })
  local lspkind = require('lspkind')
  cmp.setup {
    formatting = {
      format = require'lspkind'.cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
  
        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function (entry, vim_item)
          return vim_item
        end
      })
    }
  }
  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['dartls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['clangd'].setup {
--    cmd = {"/Users/shuji/workspace/esp-clang/bin/clangd", "--background-index", "--query-driver=/Users/shuji/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-*"},
    cmd = {"clangd", "--background-index", "--query-driver=/Users/shuji/workspace/MWSTAGE/Tools/ba-elf-ba2-r36379/bin/ba-elf-*"},
    capabilities = capabilities
  }

EOF
