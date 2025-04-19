vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", "<cmd>Explore<CR>", { noremap = true, desc = "Explore" })

vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, desc = "Move to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, desc = "Move to bottom window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, desc = "Move to top window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, desc = "Move to right window" })
--this isnt super comfortable, would be nicer some other way
vim.keymap.set("n", "<leader><C-h>", "<C-w>H", { noremap = true, desc = "Move window left" })
vim.keymap.set("n", "<leader><C-j>", "<C-w>J", { noremap = true, desc = "Move window down" })
vim.keymap.set("n", "<leader><C-k>", "<C-w>K", { noremap = true, desc = "Move window up" })
vim.keymap.set("n", "<leader><C-l>", "<C-w>L", { noremap = true, desc = "Move window right" })
--vim.keymap.set("n", "<leader>s", ":exe 'lwincmd w | wincmd '.(winwidth(0) == &columns ? 'H' : 'K')<CR>", { noremap = true, desc = "Move window right" })

vim.keymap.set("n", "<Left>", "zh", { noremap = true, desc = "Scroll left" })
vim.keymap.set("n", "<Down>", "<S-Down>", { noremap = true, desc = "Scroll down" })
vim.keymap.set("n", "<Up>", "<S-Up>", { noremap = true, desc = "Scroll up" })
vim.keymap.set("n", "<Right>", "zl", { noremap = true, desc = "Scroll right" })

vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { noremap = true, desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { noremap = true, desc = "Quit all" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { noremap = true, desc = "Save" })
