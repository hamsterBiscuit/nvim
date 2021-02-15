local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
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

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", [[compe#confirm({ 'keys': "<Plug>delimitMateCR", 'mode': '' })]], { noremap = true, expr = true})

-- vsnip Expand or jump
vim.api.nvim_set_keymap("i", "<C-n>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true})
vim.api.nvim_set_keymap("s", "<C-n>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true})

-- accelerated-jk
-- vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {silent = true})
-- vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {silent = true})

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
-- vim.api.nvim_set_keymap("v", "sa", "<Plug>(operator-surround-append)", {silent = true})
-- vim.api.nvim_set_keymap("v", "sd", "<Plug>(operator-surround-delete)", {silent = true})
-- vim.api.nvim_set_keymap("v", "sr", "<Plug>(operator-surround-replace)", {silent = true})

-- LSP
vim.api.nvim_set_keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gd", "<cmd>Lspsaga preview_definition<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gs", "<cmd>Lspsaga signature_help<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gr", "<cmd>Lspsaga rename<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "ga", "<cmd>Lspsaga code_action<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("v", "ga", "<cmd>Lspsaga range_code_action<CR>", {silent = true, noremap = true})

-- gitsigns.nvim
vim.api.nvim_set_keymap("n", "[g", "<cmd>lua require\"gitsigns\".prev_hunk()<CR>", {})
vim.api.nvim_set_keymap("n", "]g", "<cmd>lua require\"gitsigns\".next_hunk()<CR>", {})

-- vim-eft
-- vim.api.nvim_set_keymap("n", ";", "<plug>(eft-repeat)", {})
-- vim.api.nvim_set_keymap("x", ";", "<plug>(eft-repeat)", {})
-- vim.api.nvim_set_keymap("n", "f", "<plug>(eft-f)", {})
-- vim.api.nvim_set_keymap("x", "f", "<plug>(eft-f)", {})
-- vim.api.nvim_set_keymap("o", "f", "<plug>(eft-f)", {})
-- vim.api.nvim_set_keymap("n", "F", "<plug>(eft-F)", {})
-- vim.api.nvim_set_keymap("x", "F", "<plug>(eft-F)", {})
-- vim.api.nvim_set_keymap("o", "F", "<plug>(eft-F)", {})
-- vim.api.nvim_set_keymap("n", "t", "<plug>(eft-t)", {})
-- vim.api.nvim_set_keymap("x", "t", "<plug>(eft-t)", {})
-- vim.api.nvim_set_keymap("o", "t", "<plug>(eft-t)", {})
-- vim.api.nvim_set_keymap("n", "T", "<plug>(eft-T)", {})
-- vim.api.nvim_set_keymap("x", "T", "<plug>(eft-T)", {})
-- vim.api.nvim_set_keymap("o", "T", "<plug>(eft-T)", {})

-- asynctasks
vim.api.nvim_set_keymap("n", "<F5>", ":<C-u>AsyncTask file-run<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<F9>", ":<C-u>AsyncTask file-build<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<F6>", ":<C-u>AsyncTask project-run<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<F7>", ":<C-u>AsyncTask project-build<CR>", {silent = true, noremap = true})

