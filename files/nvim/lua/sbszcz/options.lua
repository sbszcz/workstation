-- vim.lsp.set_log_level("debug")

vim.g.mapleader = " " -- Set '<space>' as leader key
vim.g.maplocalleader = " " -- Set '<space>' as leader key
vim.o.number = true -- Print line numbers
vim.o.tabstop = 2  -- Number of spaces tabs count for
vim.o.shiftwidth = 2 -- Size of an indent
vim.o.norelativenumber = true -- Relative line numbers
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

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
vim.wo.signcolumn = "yes"

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

-- Only show current mode in lualine
vim.opt.showmode = false
