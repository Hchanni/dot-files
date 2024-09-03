-- space bar leader key
vim.g.mapleader = " "

-- Anything not related to plugins but vim generally
vim.keymap.set("i", "jj", "<Esc>", { desc = "Esc" })

-- "<cr>" basically is pressing enter, people also use +

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
