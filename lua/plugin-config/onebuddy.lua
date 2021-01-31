return function()
  require("colorbuddy").colorscheme("onebuddy")
  local Color, c, Group, g, s = require("colorbuddy").setup()
  Group.new("SignColumn", c.mono_4, c.none, s.NONE)
  Group.new("EndOfBuffer", c.syntax_bg, c.none, s.NONE)
  vim.o.background = "light"
end
