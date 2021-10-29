
local cmp = require "cmp"
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local tab_complete = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif has_words_before() and vim.fn["vsnip#available"]() == 1 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "", true)
  else
    fallback()
  end
end
local s_tab_complete = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif has_words_before() and vim.fn["vsnip#available"]() == 1 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "", true)
  else
    fallback()
  end
end

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

cmp.setup {
  completion = {
    completeopt = "menu,menuone,noselect"
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = {
    ["<Tab>"] = tab_complete,
    ["<C-j>"] = tab_complete,
    ["<S-Tab>"] = s_tab_complete,
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false
    },
    ["<C-k>"] = s_tab_complete
  },
  sources = {{name = "nvim_lsp"}, {name = "path"}, {name = "buffer"}, {name = "vsnip"}, {name = "tags"}, {name = "spell"}, {name = "vim-dadbod-completion"}}
}

