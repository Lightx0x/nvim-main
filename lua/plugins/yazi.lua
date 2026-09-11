return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>yz", "<cmd>Yazi<cr>", desc = "Open yazi at current file" },
		{ "<leader>yw", "<cmd>Yazi cwd<cr>", desc = "Open yazi in working directory" },
	},
	opts = {
		open_for_directories = false,
		floating_window_scaling_factor = 0.85,
	},
}
