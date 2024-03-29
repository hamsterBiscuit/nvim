vim.keybinds = {
  gmap = vim.api.nvim_set_keymap,
  bmap = vim.api.nvim_buf_set_keymap,
  dgmap = vim.api.nvim_del_keymap,
  dbmap = vim.api.nvim_buf_del_keymap,
  opts = {noremap = true, silent = true}
}

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

-- vsnip Expand or jump
vim.api.nvim_set_keymap("i", "<C-n>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true})
vim.api.nvim_set_keymap("s", "<C-n>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true})

-- fuzzyfind 模糊搜索 快捷键
vim.api.nvim_set_keymap("n", "<Leader>bb", ":<C-u>Telescope buffers<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fa", ":<C-u>Telescope live_grep<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>ff", ":<C-u>Telescope find_files<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fh", ":<C-u>Telescope oldfiles<CR>", {silent = true, noremap = true})

-- 文件管理
vim.api.nvim_set_keymap("n", "<Leader>e", ":<C-u>NvimTreeToggle<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>F", ":<C-u>NvimTreeFindFile<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "<Leader>o", ":<C-u>LSoutlineToggle<CR>", {silent = true, noremap = true})

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
vim.api.nvim_set_keymap("n", "[e", "<cmd>LspUI diagnostic prev<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "]e", "<cmd>LspUI diagnostic next<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "K", "<cmd>LspUI hover<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gd", "<cmd>LspUI definition<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "gs", "<cmd>Lspsaga signature_help<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gr", "<cmd>LspUI rename<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "ga", "<cmd>LspUI code_action<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>tt", "<cmd>exe v:count.'ToggleTerm'<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap(
  "n",
  "<Leader>tf",
  "<cmd>lua require('toggleterm').float_toggle()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<Leader>ta", "<cmd>ToggleTermToggleAll<CR>", {silent = true, noremap = true})
