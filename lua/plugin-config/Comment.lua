local comment_string = require("ts_context_commentstring")
require("Comment").setup(
  {
    toggler = {
      -- 切换行注释
      line = "gcc",
      --- 切换块注释
      block = "gCC"
    },
    opleader = {
      -- 可视模式下的行注释
      line = "gc",
      -- 可视模式下的块注释
      block = "gC"
    },
    extra = {
      -- 在当前行上方新增行注释
      above = "gcO",
      -- 在当前行下方新增行注释
      below = "gco",
      -- 在当前行行尾新增行注释
      eol = "gcA"
    },
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  }
)
