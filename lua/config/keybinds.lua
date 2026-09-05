-- Keybinds config for simple neovim navigation
-- set leader key
vim.g.mapleader = " "
-- netrw window
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
-- don't paste over my paste
vim.keymap.set("x", "p", '"_dP')
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
-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gr", function()
	require("telescope.builtin").lsp_references({ include_current_line = true })
end)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
