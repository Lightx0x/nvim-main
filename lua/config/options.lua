vim.opt.number = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 4
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
vim.o.smartcase = true -- Smart case (default: false)
-- vim.o.autoindent = true         -- Copy indent from current line when starting new one (default: true)
vim.o.linebreak = true -- Companion to wrap, don't split words (default: false)
vim.o.hlsearch = false -- Set highlight on search (default: true)
vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim. (default: '')
-- keep more context on screen while scrolling
vim.opt.scrolloff = 2
-- never show me line breaks if they're not there
vim.opt.wrap = false
-- always draw sign column. prevents buffer moving when adding/deleting sign
vim.opt.signcolumn = "yes"
-- sweet sweet relative line numbers
vim.opt.relativenumber = true
