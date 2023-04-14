vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- Multiplexing opt parameters
local opt = { noremap = true, silent = true }

-- Cancel s default function
map("n", "s", "", opt)
-- Windows split screen shortcuts
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- Close current
map("n", "sc", "<C-w>c", opt)
-- Close other
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl jump between windows
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- Left and right proportional control
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- Up and down ratio
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- Ratio
map("n", "s=", "<C-w>=", opt)

-- Terminal related
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<A-s>", "<C-\\><C-n>", opt)

-- Indent code in visual mode
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- Move selected text up and down
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- Scroll up and down
map("n", "<C-j>", "3j", opt)
map("n", "<C-k>", "3k", opt)
-- Ctrl u / ctrl + d move only 9 lines, half screen by default
map("n", "<C-u>", "7k", opt)
map("n", "<C-d>", "7j", opt)

-- Paste without copying in visual mode
map("v", "p", '"_dP', opt)

-- Exit
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

-- In insert mode, jump to the beginning of the line and the end of the line
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- ctrl+s save
map("n", "<C-s>", ":w<CR>", opt)
map("i", "<C-s>", "<ESC>:w<CR>", opt)

-- Configure Copy Shortcuts
map("v", "<C-c>", '"+y', opt) -- copy
map("v", "<C-x>", '"+d', opt) -- cut
-- map("n", "<C-v>", '"+p', opt) -- paste from system clipboard
map("i", "<C-v>", '<ESC>"+pa', opt) -- paste from system clipboard

--------------------------------
--------------------------------

-- bufferline keybind
-- Left and right tab switching
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- Close
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bj", ":BufferLineMoveNext<CR>", opt)
map("n", "<leader>bk", ":BufferLineMovePrev<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- find files
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- Global search
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- workspace_diagnostics
map("n", "<leader>wd", ":Telescope diagnostics<CR>", opt)
-- undo
map("n", "<leader>u", ":Telescope undo<cr>", opt)

-- translator
map("n", "<leader>tl", ":TranslateW<CR>", opt)
map("v", "<leader>tl", ":TranslateW<CR>", opt)

-- Floating terminal floaterm
map("n", "<leader>ft", ":FloatermNew<CR>", opt)
map("n", "<leader>fj", ":FloatermPrev<CR>", opt)
map("n", "<leader>fk", ":FloatermNext<CR>", opt)
map("n", "<leader>fs", ":FloatermToggle<CR>", opt)
map("n", "<leader>fc", ":FloatermKill<CR>", opt)
map("n", "<leader>fd", ":FloatermNew lazydocker <CR>", opt)
map("n", "<leader>fg", ":FloatermNew lazygit <CR>", opt)

-- nvim-tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)

-- aerial
map("n", "<leader>a", "<cmd>AerialToggle!<CR>", opt)
