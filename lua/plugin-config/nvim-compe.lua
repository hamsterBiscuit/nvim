
local check_back_space = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col == 0 or vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") ~= nil
end

local tab_complete = function(fallback)
  if vim.fn.pumvisible() == 1 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n", true)
  elseif check_back_space() then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
  elseif vim.fn["vsnip#available"]() == 1 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "", true)
  else
    fallback()
  end
end
local s_tab_complete = function(fallback)
  if vim.fn.pumvisible() == 1 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n", true)
  elseif check_back_space() then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true), "n", true)
  elseif vim.fn["vsnip#available"]() == 1 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "", true)
  else
    fallback()
  end
end
local cmp = require "cmp"

cmp.setup {
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

