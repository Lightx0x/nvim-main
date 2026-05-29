-- ~/.config/nvim/lua/plugins/flterm.lua

return {
	{
		dir = vim.fn.stdpath("config") .. "/lua/plugins",
		name = "floating-terminal",

		config = function()
			local state = {
				floating = { buf = -1, win = -1 },
			}

			local function open_floating_terminal()
				local width = math.floor(vim.o.columns * 0.85)
				local height = math.floor(vim.o.lines * 0.85)

				local row = math.floor((vim.o.lines - height) / 2)
				local col = math.floor((vim.o.columns - width) / 2)

				-- Create buffer if it doesn't exist or is invalid
				if not vim.api.nvim_buf_is_valid(state.floating.buf) then
					state.floating.buf = vim.api.nvim_create_buf(false, true)
				end

				-- Open the floating window
				local win = vim.api.nvim_open_win(state.floating.buf, true, {
					relative = "editor",
					width = width,
					height = height,
					row = row,
					col = col,
					style = "minimal",
					border = "rounded",
				})

				state.floating.win = win

				-- Start terminal if not already done
				if vim.bo[state.floating.buf].buftype ~= "terminal" then
					vim.fn.termopen(vim.o.shell)
				end

				-- Always enter insert mode when opening the floating terminal
				vim.cmd("startinsert!")
			end

			local function toggle_floating_terminal()
				if vim.api.nvim_win_is_valid(state.floating.win) then
					vim.api.nvim_win_hide(state.floating.win)
				else
					open_floating_terminal()
				end
			end

			vim.keymap.set("n", "<leader>ft", toggle_floating_terminal, {
				desc = "Toggle Floating Terminal",
				silent = true,
			})

			vim.api.nvim_create_user_command("Flterm", toggle_floating_terminal, {})

			-- Exit terminal mode with <C-t>
			vim.keymap.set("t", "<C-x>", "<C-\\><C-n>:close!<CR>", {
				noremap = true,
				silent = true,
				-- Apply to the buffer once it's created
				callback = function()
					if vim.api.nvim_buf_is_valid(state.floating.buf) then
						vim.keymap.set("t", "<C-x>", "<C-\\><C-n>:close!<CR>", {
							noremap = true,
							silent = true,
							buffer = state.floating.buf,
						})
					end
				end,
			})
		end,
	},
}
