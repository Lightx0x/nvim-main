local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local function reduce_colors()
	local fg = "#d4be98"
	local yellow = "#d8a657"
	local green = "#a9b665"
	local slate = "#a0a0a0"
	local red = "#ea6962"
	local orange = "#e78a4e"
	local grey = "#928374"

	local hl = vim.api.nvim_set_hl

	-- Keywords and control flow — yellow
	hl(0, "Keyword", { fg = yellow })
	hl(0, "Conditional", { fg = yellow })
	hl(0, "Repeat", { fg = yellow })
	hl(0, "Statement", { fg = yellow })
	hl(0, "Exception", { fg = yellow })
	hl(0, "Operator", { fg = yellow })
	hl(0, "Include", { fg = yellow })
	hl(0, "StorageClass", { fg = yellow })
	hl(0, "@keyword", { fg = yellow })
	hl(0, "@keyword.return", { fg = yellow })
	hl(0, "@keyword.function", { fg = yellow })
	hl(0, "@keyword.operator", { fg = yellow })
	hl(0, "@conditional", { fg = yellow })
	hl(0, "@repeat", { fg = yellow })
	hl(0, "@exception", { fg = yellow })
	hl(0, "@include", { fg = yellow })
	hl(0, "@operator", { fg = yellow })

	-- Strings — green
	hl(0, "String", { fg = green })
	hl(0, "@string", { fg = green })

	-- Errors — red
	hl(0, "Error", { fg = red })

	-- Types — yellow (like keywords)
	hl(0, "Type", { fg = yellow })
	hl(0, "@type", { fg = yellow })
	hl(0, "@type.builtin", { fg = yellow })
	hl(0, "@constructor", { fg = yellow })

	-- Functions, methods, module paths — warm sand
	hl(0, "Function", { fg = slate })
	hl(0, "@function", { fg = slate })
	hl(0, "@function.call", { fg = slate })
	hl(0, "@method", { fg = slate })
	hl(0, "@method.call", { fg = slate })
	hl(0, "@module", { fg = slate })
	hl(0, "@namespace", { fg = slate })

	-- Everything else — foreground
	hl(0, "Identifier", { fg = fg })
	hl(0, "Constant", { fg = fg })
	hl(0, "Number", { fg = fg })
	hl(0, "Boolean", { fg = fg })
	hl(0, "Float", { fg = fg })
	hl(0, "Special", { fg = fg })
	hl(0, "Delimiter", { fg = fg })
	hl(0, "PreProc", { fg = fg })
	hl(0, "@variable", { fg = fg })
	hl(0, "@property", { fg = fg })
	hl(0, "@field", { fg = fg })
	hl(0, "@parameter", { fg = fg })
	hl(0, "@constant", { fg = fg })
	hl(0, "@constant.builtin", { fg = fg })
	hl(0, "@number", { fg = fg })
	hl(0, "@boolean", { fg = fg })
	hl(0, "@punctuation", { fg = fg })
	hl(0, "@punctuation.bracket", { fg = fg })
	hl(0, "@punctuation.delimiter", { fg = fg })
	hl(0, "@tag", { fg = fg })
	hl(0, "@tag.attribute", { fg = fg })
	hl(0, "@tag.delimiter", { fg = fg })

	-- LSP semantic token overrides
	hl(0, "@lsp.type.struct", { fg = yellow })
	hl(0, "@lsp.type.enum", { fg = yellow })
	hl(0, "@lsp.type.typeAlias", { fg = yellow })
	hl(0, "@lsp.type.interface", { fg = yellow })
	hl(0, "@lsp.type.type", { fg = yellow })
	hl(0, "@lsp.type.builtinType", { fg = yellow })
	hl(0, "@lsp.type.typeParameter", { fg = yellow })
	hl(0, "@lsp.type.derive", { fg = yellow })
	hl(0, "@lsp.type.macro", { fg = orange })
	hl(0, "@function.macro", { fg = orange })
	hl(0, "Macro", { fg = orange })
	hl(0, "@lsp.type.formatSpecifier", { fg = orange })
	hl(0, "@lsp.type.property", { fg = fg })
	hl(0, "@lsp.type.member", { fg = fg })
	hl(0, "@lsp.type.variable", { fg = fg })
	hl(0, "@lsp.type.parameter", { fg = fg })
	hl(0, "@lsp.type.function", { fg = slate })
	hl(0, "@lsp.type.method", { fg = slate })
	hl(0, "@lsp.type.enumMember", { fg = fg })
	hl(0, "@lsp.type.namespace", { fg = slate })

	-- Comments — grey italic
	hl(0, "Comment", { fg = grey, italic = true })
	hl(0, "@comment", { fg = grey, italic = true })
end

return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_foreground = "material"

			vim.o.background = "dark"
			vim.cmd.colorscheme("gruvbox-material")
			enable_transparency()
			reduce_colors()
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "gruvbox-material",
		},
	},
}
