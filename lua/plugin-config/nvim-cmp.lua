local cmp = require "cmp"
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local lspkind = require("lspkind")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

lspkind.init(
  {
    mode = "symbol_text"
    -- preset = "codicons"
  }
)

cmp.setup(
  {
    preselect = cmp.PreselectMode.Item,
    mapping = cmp.mapping.preset.insert(
      {
        ["<Tab>"] = function(fallback)
          if not cmp.select_next_item() then
            if vim.bo.buftype ~= "prompt" and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
        ["<S-Tab>"] = function(fallback)
          if not cmp.select_prev_item() then
            if vim.bo.buftype ~= "prompt" and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false
        },
        ["<C-j>"] = function(fallback)
          if not cmp.select_next_item() then
            if vim.bo.buftype ~= "prompt" and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
        ["<C-k>"] = function(fallback)
          if not cmp.select_prev_item() then
            if vim.bo.buftype ~= "prompt" and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["CR>"] = cmp.mapping.complete({select = true})
      }
    ),
    sources = cmp.config.sources(
      {
        {name = "nvim_lsp"},
        {name = "async_path"},
        {name = "buffer"}
        -- {name = "nvim_lsp_signature_help"}
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
