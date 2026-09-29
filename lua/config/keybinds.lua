-- Keybinds config for simple neovim navigation
-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
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
vim.keymap.set("n", "grr", function()
	require("telescope.builtin").lsp_references({ include_current_line = true })
end, { desc = "LSP references (telescope)" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
-- Todo comments
-- Cycles forward through the buffer, wrapping to the top after the last todo
vim.keymap.set("n", "<leader>t", function()
	local highlight = require("todo-comments.highlight")
	local comments_only = require("todo-comments.config").options.highlight.comments_only
	local buf = vim.api.nvim_get_current_buf()
	local count = vim.api.nvim_buf_line_count(buf)
	local cur = vim.api.nvim_win_get_cursor(0)[1]
	for i = 1, count do
		local l = (cur + i - 1) % count + 1
		local line = vim.api.nvim_buf_get_lines(buf, l - 1, l, false)[1] or ""
		local ok, start, _, kw = pcall(highlight.match, line)
		if ok and kw and not (comments_only and highlight.is_comment(buf, l - 1, start) == false) then
			vim.api.nvim_win_set_cursor(0, { l, start - 1 })
			return
		end
	end
	vim.notify("No todo comments in buffer", vim.log.levels.WARN)
end, { desc = "Next todo comment (wraps)" })
vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
-- Sibling files: open the next/previous file in the current file's directory (wraps)
local function sibling_file(step)
	local path = vim.api.nvim_buf_get_name(0)
	if path == "" then
		return vim.notify("Buffer has no file", vim.log.levels.WARN)
	end
	local dir, name = vim.fs.dirname(path), vim.fs.basename(path)
	local files = {}
	for entry, type in vim.fs.dir(dir) do
		if type == "file" then
			table.insert(files, entry)
		end
	end
	table.sort(files)
	local idx = 0
	for i, f in ipairs(files) do
		if f == name then
			idx = i
			break
		end
	end
	if #files == 0 or (#files == 1 and idx == 1) then
		return vim.notify("No other files in directory", vim.log.levels.WARN)
	end
	-- if the current file isn't in the list, <leader>p should land on the last file
	if idx == 0 and step < 0 then
		idx = #files + 1
	end
	local next_idx = (idx - 1 + step) % #files + 1
	vim.cmd.edit(vim.fn.fnameescape(vim.fs.joinpath(dir, files[next_idx])))
end
vim.keymap.set("n", "<leader>n", function()
	sibling_file(1)
end, { desc = "Next file in directory" })
vim.keymap.set("n", "<leader>p", function()
	sibling_file(-1)
end, { desc = "Previous file in directory" })
