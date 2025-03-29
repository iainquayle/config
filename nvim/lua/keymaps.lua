vim.g.mapleader = ","
vim.keymap.set("n", "<leader>ee", "<cmd>Explore<CR>", { noremap = true })
-- move between windows
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true })
--scroll buffer
vim.keymap.set("n", "<Left>", "zh", { noremap = true })
vim.keymap.set("n", "<Down>", "<S-Down>", { noremap = true })
vim.keymap.set("n", "<Up>", "<S-Up>", { noremap = true })
vim.keymap.set("n", "<Right>", "zl", { noremap = true })
