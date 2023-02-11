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
          ["rust-analyzer"] = {
          }
        },
      }

      require('lspconfig')['sumneko_lua'].setup {
        settings = {
        }
      }


    end
  },

  { "unblevable/quick-scope" },

  { "rmehri01/onenord.nvim" },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
	    require("lualine").setup()
    end
  },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufReadPost" }
})

