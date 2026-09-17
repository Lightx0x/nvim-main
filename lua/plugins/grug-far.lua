return {
	"MagicDuck/grug-far.nvim",
	keys = {
		{ "<leader>sr", "<cmd>GrugFar<cr>", desc = "Search and replace" },
		{
			"<leader>sw",
			function()
				require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
			end,
			desc = "Search and replace current word",
		},
	},
	opts = {},
}
