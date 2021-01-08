
-- Write buffer (save)
vim.api.nvim_set_keymap('i', '<C-s>', ':<C-u>write<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':<C-u>write<CR>', { noremap = true })

vim.api.nvim_set_keymap('i', '<C-h>', '<BS>', {})
vim.api.nvim_set_keymap('i', '<C-d>', '<Del>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-S>', '<esc>:w<CR>', {})
vim.api.nvim_set_keymap('i', '<C-Q>', '<esc>:wq<CR>', {})

-- switch window
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ws', ':<C-u>sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>wv', ':<C-u>vs<CR>', { noremap = true })

vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })

-- vsnip Expand or jump
vim.api.nvim_set_keymap('i', '<C-n>', "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true })
vim.api.nvim_set_keymap('s', '<C-n>', "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true })

-- accelerated-jk
vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', { silent = true })
vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', { silent = true })

-- vim-eft
vim.api.nvim_set_keymap('n', 'f', '<Plug>(eft-f)', {})
vim.api.nvim_set_keymap('x', 'f', '<Plug>(eft-f)', {})
vim.api.nvim_set_keymap('o', 'f', '<Plug>(eft-f)', {})
vim.api.nvim_set_keymap('n', 'F', '<Plug>(eft-F)', {})
vim.api.nvim_set_keymap('x', 'F', '<Plug>(eft-F)', {})
vim.api.nvim_set_keymap('o', 'F', '<Plug>(eft-F)', {})

-- fuzzyfind 模糊搜索 快捷键
vim.api.nvim_set_keymap('n', '<Leader>bb', ':<C-u>Clap buffers<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fa', ':<C-u>Clap grep<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ff', ':<C-u>Clap files<CR>', { silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':<C-u>Clap history<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fl', ':<C-u>Clap loclist<CR>', { silent = true, noremap = true })

-- 文件管理
vim.api.nvim_set_keymap('n', '<Leader>e', ':<C-u>NvimTreeToggle<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>F', ':<C-u>NvimTreeFindFile<CR>', { silent = true, noremap = true })

-- Vista
vim.api.nvim_set_keymap('n', '<Leader>v', ':<C-u>Vista!!<CR>', { silent = true, noremap = true })

-- operator mappings
vim.api.nvim_set_keymap('', 'sa', '<Plug>(operator-surround-append)', { silent = true })
vim.api.nvim_set_keymap('', 'sd', '<Plug>(operator-surround-delete)', { silent = true })
vim.api.nvim_set_keymap('', 'sr', '<Plug>(operator-surround-replace)', { silent = true })
