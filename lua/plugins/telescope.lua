return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ hidden = true, no_ignore = false })
		end, { desc = "Telescope find files (incl hidden)" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}

-- To include hidden files for live grep (takes longer so might not be needed)
-- Uncomment lines below and commment the return table above
-- return {
-- 	"nvim-telescope/telescope.nvim",
-- 	tag = "0.1.8",
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	config = function()
-- 		local builtin = require("telescope.builtin")
-- 		vim.keymap.set("n", "<leader>ff", function()
-- 			builtin.find_files({ hidden = true, no_ignore = false })
-- 		end, { desc = "Telescope find files (incl hidden)" })
-- 		vim.keymap.set("n", "<leader>fg", function()
-- 			builtin.live_grep({ additional_args = { "--hidden" } })
-- 		end, { desc = "Telescope live grep (incl hidden)" })
-- 		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
-- 		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- 	end,
-- }
