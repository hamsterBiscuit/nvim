return function()
  require("indent_guides").setup {
    exclude_filetypes = {"help", "dashboard", "dashpreview", "LuaTree", "vista", "sagahover"}
  }
end