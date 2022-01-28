
-- Write buffer (save)
vim.api.nvim_set_keymap("i", "<C-s>", ":<C-u>write<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-s>", ":<C-u>write<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-q>", "<esc>:wq<CR>", {})

vim.api.nvim_set_keymap("i", "<C-h>", "<BS>", {})
vim.api.nvim_set_keymap("i", "<C-d>", "<Del>", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-S>", "<esc>:w<CR>", {})
vim.api.nvim_set_keymap("i", "<C-q>", "<esc>:wq<CR>", {})

-- switch window
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true})
vim.api.nvim_set_keymap("n", "<A-h>", ":bp<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<A-l>", ":bn<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>ws", ":<C-u>sp<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>wv", ":<C-u>vs<CR>", {noremap = true})

vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", {noremap = true, silent = true})

-- vsnip Expand or jump
vim.api.nvim_set_keymap("i", "<C-n>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true})
vim.api.nvim_set_keymap("s", "<C-n>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true})

-- Plugin Floaterm
vim.api.nvim_set_keymap("n", "<A-d>", ":Lspsaga open_floaterm<CR>", {noremap = true})
vim.api.nvim_set_keymap("t", "<A-d>", [[<C-\><C-n>:Lspsaga close_floaterm<CR>]], {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>g", ":Lspsaga open_floaterm lazygit<CR>", {noremap = true})

-- fuzzyfind 模糊搜索 快捷键
vim.api.nvim_set_keymap("n", "<Leader>bb", ":<C-u>Telescope buffers<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fa", ":<C-u>Telescope live_grep<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>ff", ":<C-u>Telescope find_files<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fh", ":<C-u>Telescope oldfiles<CR>", {silent = true, noremap = true})

-- 文件管理
vim.api.nvim_set_keymap("n", "<Leader>e", ":<C-u>NvimTreeToggle<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>F", ":<C-u>NvimTreeFindFile<CR>", {silent = true, noremap = true})

-- Vista
vim.api.nvim_set_keymap("n", "<Leader>v", ":<C-u>SymbolsOutline<CR>", {silent = true, noremap = true})

-- BufferLine
vim.api.nvim_set_keymap("n", "<Leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", {silent = true, noremap = true})

-- LSP
vim.api.nvim_set_keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gd", "<cmd>Lspsaga preview_definition<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gs", "<cmd>Lspsaga signature_help<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gr", "<cmd>Lspsaga rename<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "ga", "<cmd>Lspsaga code_action<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("v", "ga", "<cmd>Lspsaga range_code_action<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {silent = true})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {silent = true})

