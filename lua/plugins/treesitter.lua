return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "lua", "rust", "typescript", "tsx", "javascript" },
		})
	end,
}
