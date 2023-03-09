-- Setup lazy.vim as plugin manager
--
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

-- Configure plugins
--
require("lazy").setup({

  { 'folke/which-key.nvim', opts = {} },

  { "williamboman/mason.nvim" },

  { "williamboman/mason-lspconfig.nvim" },

  { "neovim/nvim-lspconfig" },

  { 'j-hui/fidget.nvim', opts = {} },

  { "hrsh7th/cmp-nvim-lsp", dependencies = { "hrsh7th/nvim-cmp" } },
  { "hrsh7th/cmp-path", dependencies = { "hrsh7th/nvim-cmp" } },
  { "hrsh7th/cmp-buffer", dependencies = { "hrsh7th/nvim-cmp" }  },

  { "L3MON4D3/LuaSnip", version = "1.2.1" },

  { "simrat39/rust-tools.nvim" },

  { "unblevable/quick-scope" },

  { "rmehri01/onenord.nvim" },

  { "nvim-lualine/lualine.nvim", dependencies = { 'kyazdani42/nvim-web-devicons' } },

  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufReadPost" }
})

