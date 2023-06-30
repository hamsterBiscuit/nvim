-- vim.cmd [[packadd schemastore.nvim]]
return {
  settings = {
    json = {
      validate = { enable = true },
      schemas = require("schemastore").json.schemas()
    }
  }
}
