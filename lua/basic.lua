-- Search do not highlight
vim.o.hlsearch = false
-- Search as you type
vim.o.incsearch = true
-- The command line height is 2, providing enough display space
vim.o.cmdheight = 1
-- Automatically load when the file is modified by an external program
vim.o.autoread = true
vim.bo.autoread = true
-- No line breaks
vim.wo.wrap = false
-- <Left><Right> can jump to the next line when the cursor is at the beginning and end of the line
vim.o.whichwrap = "<,>,[,]"
-- Allows to hide modified buffers
vim.o.hidden = true
-- mouse support
vim.o.mouse = "a"
-- Disable creation of backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- Set timeoutlen to wait 500 milliseconds for the keyboard shortcut combo time, which can be set as needed
vim.o.timeoutlen = 500
-- split window appears from bottom and right
vim.o.splitbelow = true
vim.o.splitright = true
-- Autocompletion is not automatically selected
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- Style
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- Display of invisible characters, here only spaces are displayed as a dot
vim.o.list = true
vim.o.listchars = "space:·,tab:··,eol:↴"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- Completion enhancement
vim.o.wildmenu = true
-- Don't pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
-- Completion displays up to 10 lines
vim.o.pumheight = 10
-- always show tabline
vim.o.showtabline = 1
-- vim's modal prompt is no longer required after using the enhanced status bar plugin
vim.o.showmode = false

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

------- Here is basical icon replace -------
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	-- Also update the prompt in input mode, setting to true may affect performance
	update_in_insert = false,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
------- Here is basical icon replace -------

-- some setting for specific language
vim.g.zig_fmt_autosave = false

