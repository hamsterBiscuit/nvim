return function()
  require("zephyr")
  local syntax = require "zephyr".get_zephyr_color()
  vim.api.nvim_command("highlight htmlTagName gui=bold guifg=" .. syntax.orange .. " guibg=NONE cterm=bold")
  vim.api.nvim_command("highlight htmlArg gui=NONE guifg=" .. syntax.blue .. " guibg=NONE cterm=bold")
  vim.api.nvim_command("highlight htmlTag gui=NONE guifg=" .. syntax.blue .. " guibg=NONE cterm=bold")
end