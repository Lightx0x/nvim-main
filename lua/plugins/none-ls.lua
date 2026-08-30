return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- Formatters & linters for mason to install
		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier", -- ts/js formatter
				"eslint_d", -- ts/js linter
				"shfmt", -- Shell formatter
				"checkmake", -- linter for Makefiles
				"stylua", -- lua formatter; Already installed via Mason
				-- 'ruff', -- Python linter and formatter; Already installed via Mason
			},
			automatic_installation = true,
		})

		local sources = {
			diagnostics.checkmake,
			formatting.prettier,
			formatting.stylua,
			formatting.shfmt.with({ args = { "-i", "4" } }),
		}

		null_ls.setup({
			sources = sources,
		})
	end,
}
