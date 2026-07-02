vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.o.foldenable = true
vim.o.foldlevelstart = 0
vim.o.foldnestmax = 5
vim.o.foldcolumn = "auto:2"
vim.o.foldtext = ""

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client
            and client:supports_method("textDocument/foldingRange") then
            vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
        end
    end,
})
