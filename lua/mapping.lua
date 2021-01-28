function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Write buffer (save)
vim.api.nvim_set_keymap("i", "<C-s>", ":<C-u>write<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-s>", ":<C-u>write<CR>", {noremap = true})

vim.api.nvim_set_keymap("i", "<C-h>", "<BS>", {})
vim.api.nvim_set_keymap("i", "<C-d>", "<Del>", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-S>", "<esc>:w<CR>", {})
vim.api.nvim_set_keymap("i", "<C-Q>", "<esc>:wq<CR>", {})

-- switch window
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>ws", ":<C-u>sp<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>wv", ":<C-u>vs<CR>", {noremap = true})

vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "<C-n>" : vsnip#available(1) ?"<Plug>(vsnip-expand-or-jump)" : v:lua.check_back_space() ? "<TAB>" : completion#trigger_completion()]], {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "<C-p>" : "<S-Tab>"]], {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-j>", [[pumvisible() ? "<C-n>" : vsnip#available(1) ?"<Plug>(vsnip-expand-or-jump)" : v:lua.check_back_space() ? "<TAB>" : completion#trigger_completion()]], {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", [[pumvisible() ? "<C-p>" : "<C-k>"]], {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", [[pumvisible() ? complete_info()["selected"] != "-1" ?"<Plug>(completion_confirm_completion)"  : "<c-e><CR>":(delimitMate#WithinEmptyPair() ? "<Plug>delimitMateCR" : "<CR>")]], { expr = true})

-- vsnip Expand or jump
vim.api.nvim_set_keymap("i", "<C-n>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true})
vim.api.nvim_set_keymap("s", "<C-n>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true})

-- accelerated-jk
vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {silent = true})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {silent = true})

-- fuzzyfind 模糊搜索 快捷键
vim.api.nvim_set_keymap("n", "<Leader>bb", ":<C-u>Telescope buffers<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fa", ":<C-u>Telescope live_grep<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>ff", ":<C-u>Telescope find_files<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fh", ":<C-u>DashboardFindHistory<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "<Leader>tf", ":<C-u>DashboardNewFile<CR>", {silent = true, noremap = true})

-- 文件管理
vim.api.nvim_set_keymap("n", "<Leader>e", ":<C-u>NvimTreeToggle<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>F", ":<C-u>NvimTreeFindFile<CR>", {silent = true, noremap = true})

-- Vista
vim.api.nvim_set_keymap("n", "<Leader>v", ":<C-u>Vista!!<CR>", {silent = true, noremap = true})

-- operator mappings
vim.api.nvim_set_keymap("", "sa", "<Plug>(operator-surround-append)", {silent = true})
vim.api.nvim_set_keymap("", "sd", "<Plug>(operator-surround-delete)", {silent = true})
vim.api.nvim_set_keymap("", "sr", "<Plug>(operator-surround-replace)", {silent = true})

-- LSP
vim.api.nvim_set_keymap("n", "[e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "]e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "ga", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("v", "ga", "<cmd>lua require('lspsaga.codeaction').range_code_action()<CR>", {silent = true, noremap = true})

-- mhinz/vim-signify
vim.api.nvim_set_keymap("n", "[g", "<plug>(signify-next-hunk)", {})
vim.api.nvim_set_keymap("n", "]g", "<plug>(signify-prev-hunk)", {})

-- vim-eft
vim.api.nvim_set_keymap("n", ";", "<plug>(eft-repeat)", {})
vim.api.nvim_set_keymap("x", ";", "<plug>(eft-repeat)", {})
vim.api.nvim_set_keymap("n", "f", "<plug>(eft-f)", {})
vim.api.nvim_set_keymap("x", "f", "<plug>(eft-f)", {})
vim.api.nvim_set_keymap("o", "f", "<plug>(eft-f)", {})
vim.api.nvim_set_keymap("n", "F", "<plug>(eft-F)", {})
vim.api.nvim_set_keymap("x", "F", "<plug>(eft-F)", {})
vim.api.nvim_set_keymap("o", "F", "<plug>(eft-F)", {})
vim.api.nvim_set_keymap("n", "t", "<plug>(eft-t)", {})
vim.api.nvim_set_keymap("x", "t", "<plug>(eft-t)", {})
vim.api.nvim_set_keymap("o", "t", "<plug>(eft-t)", {})
vim.api.nvim_set_keymap("n", "T", "<plug>(eft-T)", {})
vim.api.nvim_set_keymap("x", "T", "<plug>(eft-T)", {})
vim.api.nvim_set_keymap("o", "T", "<plug>(eft-T)", {})
