return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()

		-- The `main` branch ships no FileType autocmd, so nothing starts the
		-- highlighter outside the few filetypes Neovim's own runtime covers
		-- (lua, markdown, query, help). pcall guards against a missing parser.
		vim.api.nvim_create_autocmd("FileType", {
			desc = "Start treesitter highlighting",
			group = vim.api.nvim_create_augroup("treesitter-highlight", { clear = true }),
			pattern = {
				"lua",
				"rust",
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
			},
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
