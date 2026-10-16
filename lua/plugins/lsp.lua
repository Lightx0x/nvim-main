return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		-- servers are enabled explicitly via vim.lsp.enable below
		opts = { automatic_enable = false },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			-- Anchor's macros (#[program], #[derive(Accounts)], ...) emit code gated on Anchor's own
			-- feature flags, spanned onto user code, so it lights up with inactive-code hints. Drop those.
			local anchor_features = {
				"anchor-debug", "cpi", "no-entrypoint", "no-idl", "no-log-ix-name",
				"idl-build", "custom-heap", "custom-panic", "event-cpi",
			}
			local function drop_anchor_inactive(diagnostics)
				return vim.tbl_filter(function(d)
					if d.code ~= "inactive-code" and d.code ~= "inactive_code" then
						return true
					end
					for _, f in ipairs(anchor_features) do
						if d.message:find('"' .. f .. '"', 1, true) then
							return false
						end
					end
					return true
				end, diagnostics or {})
			end
			vim.lsp.config("rust_analyzer", {
				handlers = {
					["textDocument/publishDiagnostics"] = function(err, result, ctx)
						if result then
							result.diagnostics = drop_anchor_inactive(result.diagnostics)
						end
						return vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx)
					end,
					["textDocument/diagnostic"] = function(err, result, ctx)
						if result and result.items then
							result.items = drop_anchor_inactive(result.items)
						end
						return vim.lsp.handlers["textDocument/diagnostic"](err, result, ctx)
					end,
					["window/showMessage"] = function(_, result, ctx)
						if result and result.message and result.message:match("panicked") then
							return
						end
						vim.lsp.handlers["window/showMessage"](_, result, ctx)
					end,
				},
			})
			-- Inlay hints: rust_analyzer sends them by default, lua_ls and ts_ls need opting in
			vim.lsp.config("lua_ls", {
				settings = { Lua = { hint = { enable = true } } },
			})
			local ts_hints = {
				includeInlayParameterNameHints = "literals",
				includeInlayVariableTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
			}
			vim.lsp.config("ts_ls", {
				settings = {
					typescript = { inlayHints = ts_hints },
					javascript = { inlayHints = ts_hints },
				},
			})
			vim.lsp.enable({ "ts_ls", "lua_ls", "rust_analyzer" })
			vim.lsp.inlay_hint.enable(true)
			-- Servers still indexing (rust-analyzer especially) reject hint requests with
			-- ContentModified; Neovim drops those and waits for the next edit. Retry instead.
			local on_inlayhint = vim.lsp.handlers["textDocument/inlayHint"]
			vim.lsp.handlers["textDocument/inlayHint"] = function(err, result, ctx)
				if err and err.code == vim.lsp.protocol.ErrorCodes.ContentModified then
					vim.defer_fn(function()
						if vim.lsp.get_client_by_id(ctx.client_id) then
							vim.lsp.handlers["workspace/inlayHint/refresh"](nil, nil, ctx)
						end
					end, 500)
					return
				end
				return on_inlayhint(err, result, ctx)
			end
			vim.keymap.set("n", "<leader>ih", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, { desc = "Toggle inlay hints" })

			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					format = function(diagnostic)
						local code = diagnostic.code and string.format("[%s]", diagnostic.code) or ""
						return string.format("%s %s", code, diagnostic.message)
					end,
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = true,
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "ErrorMsg",
						[vim.diagnostic.severity.WARN] = "WarningMsg",
					},
				},
			})
		end,
	},
}
