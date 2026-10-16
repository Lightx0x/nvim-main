vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "css" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

-- Format once per save. When none-ls is attached its formatter (prettier, stylua, ...)
-- is the one we want, so skip the language server's own formatter.
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format on save via LSP",
	group = vim.api.nvim_create_augroup("lsp-format-on-save", { clear = true }),
	callback = function(args)
		local clients = vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/formatting" })
		if #clients == 0 then
			return
		end
		local use_null_ls = vim.iter(clients):any(function(c)
			return c.name == "null-ls"
		end)
		vim.lsp.buf.format({
			bufnr = args.buf,
			timeout_ms = 2000,
			filter = function(c)
				return not use_null_ls or c.name == "null-ls"
			end,
		})
	end,
})
