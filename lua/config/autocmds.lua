vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Format on save via LSP",
	group = vim.api.nvim_create_augroup("lsp-format-on-save", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client:supports_method("textDocument/formatting") then
			return
		end
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "lsp-format-on-save",
			buffer = args.buf,
			callback = function()
				vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 2000 })
			end,
		})
	end,
})
