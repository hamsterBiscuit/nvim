local cmp = require "cmp"
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local lspkind = require("lspkind")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
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

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))

lspkind.init(
  {
    mode = "symbol_text",
    preset = "codicons"
  }
)

cmp.setup(
  {
    -- completion = {
    --   completeopt = "menu,menuone,noselect"
    -- },
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
    sources = cmp.config.sources(
      {
        {name = "nvim_lsp"}
      },
      {
        {name = "path"},
        {name = "buffer"},
        {name = "vsnip"},
        {name = "tags"},
        {name = "vim-dadbod-completion"},
        {name = "nvim_lsp_signature_help"}
      }
    ),
    formatting = {
      format = lspkind.cmp_format(
        {
          mode = "symbol_text", -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function(_, vim_item)
            return vim_item
          end
        }
      )
    }
  }
)
cmp.setup.cmdline(
  ":",
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {
        {name = "path"}
      },
      {
        {name = "cmdline"}
      }
    )
  }
)
cmp.setup.cmdline(
  "/",
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = "buffer"}}
  }
)
