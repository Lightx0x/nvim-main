return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		on_attach = function(bufnr)
			local gs = require("gitsigns")
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			map("n", "<leader>hn", function() gs.nav_hunk("next") end, "Next hunk")
			map("n", "<leader>hp", function() gs.nav_hunk("prev") end, "Previous hunk")
			map("n", "<leader>hs", gs.stage_hunk, "Stage/unstage hunk")
			map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage selected lines")
			map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
			map("n", "<leader>hv", gs.preview_hunk, "Preview hunk")
			map("n", "<leader>hr", gs.reset_hunk, "Reset hunk (discard)")
		end,
	},
}
