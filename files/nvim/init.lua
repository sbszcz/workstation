local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.o.number = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.nowrap = true
vim.o.smartcase = true
vim.o.incsearch = true

require("lazy").setup({
  "unblevable/quick-scope",
  {
    "nvim-treesitter/nvim-treesitter", 
    cmd = "TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
          highlight = {
            ensure_installed = {"lua", "rust", "html", "vim", "help", "java", "javascript", "tsx", "typescript", "yaml", "toml"},
            enable = true,
            use_languagetree = true,
            disable = { "org" },
            additional_vim_regex_highlighting = { "org" },
          },
          indent = {
            enable = true,
          },
      })
    end

  }
})
