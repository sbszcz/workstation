-- Basic Keymaps
--
vim.g.mapleader = ";" -- Set ';' as leader key
vim.g.maplocalleader = ";" -- Set ';' as leader key
vim.o.number = true -- Print line numbers
vim.o.tabstop = 2  -- Number of spaces tabs count for
vim.o.shiftwidth = 2 -- Size of an indent
vim.o.relativenumber = true -- Relative line numbers
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.smartindent = true -- Automatically insert indents
vim.o.tabstops = 2 -- Number of spaces tabs count for
vim.o.wrap = false -- Disable line wrap
vim.o.smartcase = true -- Don't ignore case with capitals
vim.o.cursorline = true -- Enable highlighting of current line
-- vim.o.laststatus = 0
vim.o.scrolloff = 4 -- Lines of context above and below current line
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitright = true -- Put new windows right of current

vim.api.nvim_set_keymap("n", "<leader>s", ":lua print('hello world')<CR>", { silent = true}) 

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


-- Highlight on yank 
-- See `:help vim.highlight.on_yank()`
--
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Configure plugins
--
require("lazy").setup({

  {
     "williamboman/mason.nvim",
     config = function()
       require("mason").setup()
     end
  },

  {
     "williamboman/mason-lspconfig.nvim",
     config = function()
       require("mason-lspconfig").setup {
         ensure_installed = { 
           "sumneko_lua", -- Lua
           "rust_analyzer", -- Rust
           "gopls", -- Golang
           "jsonls", -- Json
           "taplo", -- TOML
           "yamlls", -- YAML
           "html", -- HTML
         },
       }
     end
  },
  
  {
    "neovim/nvim-lspconfig",
    config = function()

      require('lspconfig')['rust_analyzer'].setup {
      -- on_attach = on_attach,
      -- flags = lsp_flags,
      -- Server-specific settings...
      settings = {
        ["rust-analyzer"] = {}
      },

      require('lspconfig')['sumneko_lua'].setup {}
    }
    end
  },

  {
    "unblevable/quick-scope",
  },
 
  {
    "rmehri01/onenord.nvim",
    config = function()
      require("onenord").setup()
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
	    require("lualine").setup {
        theme = 'onedark',
	    }
   end
  },

  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      require("nvim-treesitter.configs").setup {
          highlight = {
            ensure_installed = {
              "lua",
              "bash",
              "markdown",
              "markdown_inline",
              "regex",
              "rust", 
              "go",
              "html", 
              "vim", 
              "help", 
              "java", 
              "javascript", 
              "tsx", 
              "typescript", 
              "yaml", 
              "toml"
            },
            enable = true,
            use_languagetree = true,
            disable = { "org" },
            additional_vim_regex_highlighting = { "org" },
          },
          indent = {
            enable = true,
          },
      }
    end

  }
})
