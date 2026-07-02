vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("startinsert")
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no" 
    vim.opt_local.foldcolumn = "0"
  end,
})
vim.api.nvim_create_autocmd({"TermOpen", "WinEnter", "TermEnter"}, {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd("startinsert")
    end
  end,
})
