-- Basic Keymaps
--

vim.api.nvim_set_keymap("n", "<leader>s", ":lua print('hello world')<CR>", { silent = true})
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { silent = true}) -- move half a page down but centered
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { silent = true}) -- move half a page up but centered
