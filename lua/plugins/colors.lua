local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false, -- Load immediately
		priority = 1000, -- Load first
		config = function()
			require("kanagawa").setup({
				transparent = true, -- Set to true if you want full transparency
				theme = "dragon", -- Options: "wave", "dragon", "lotus"
				compile = false,
				background = {
					dark = "dragon",
					light = "lotus",
				},
			})

			-- vim.cmd.colorscheme("kanagawa")
			-- vim.cmd.colorscheme("kanagawa-wave") -- default rich theme
			vim.cmd.colorscheme("kanagawa-dragon") -- darker, more aggressive
			-- vim.cmd.colorscheme("kanagawa-lotus") -- light theme
			enable_transparency()
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "kanagawa", -- Changed from tokyonight
		},
	},
}
