-- set leader key
vim.g.mapleader = " "
-- netrw window
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
-- make paragraph below line with Enter
vim.keymap.set("n", "<CR>", "m`o<Esc>``", { noremap = true, silent = true })
-- make paragraph above line with Alt+Enter
vim.keymap.set("n", "<A-CR>", "m`O<Esc>``", { noremap = true, silent = true })
-- bind jj to Esc key
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
-- bind jk to Esc key
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
-- diagnostics float window
vim.keymap.set("n", "D", vim.diagnostic.open_float)
-- highlighting the entire buffer
vim.keymap.set("n", "<C-h>", "ggVG", {
	desc = "select entire buffer",
	noremap = true, -- this is the default anyway
	silent = true,
})
-- make file executable
vim.keymap.set("n", "<Leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- make file unexecutable
vim.keymap.set("n", "<Leader>ux", "<cmd>!chmod -x %<CR>", { silent = true })
-- source file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
