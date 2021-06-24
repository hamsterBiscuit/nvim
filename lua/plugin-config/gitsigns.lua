vim.cmd [[packadd plenary.nvim]]
require("gitsigns").setup {
  signs = {
    add = {hl = "GitGutterAdd", text = "▋"},
    change = {hl = "GitGutterChange", text = "▋"},
    delete = {hl = "GitGutterDelete", text = "▋"},
    topdelete = {hl = "GitGutterDeleteChange", text = "▔"},
    changedelete = {hl = "GitGutterChange", text = "▎"}
  },
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,
    ["n ]g"] = {expr = true, '&diff ? \']g\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
    ["n [g"] = {expr = true, '&diff ? \'[g\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
    ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    -- Text objects
    ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>'
  },
  watch_index = {
    interval = 1000
  },
  current_line_blame = true,
  current_line_blame_delay = 100,
  current_line_blame_position = 'eol',
}
