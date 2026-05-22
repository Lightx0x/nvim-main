return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			hightlights = {
				enable = true,
			},
			Indent = { enable = true },
			autotage = { enable = true },
			ensure_installed = { "lua", "rust" },
		})
	end,
}
