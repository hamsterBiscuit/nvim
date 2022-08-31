_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath "cache" .. "/luacache_chunks"
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath "cache" .. "/luacache_modpaths"
  }
}

local present, _ = pcall(require, "impatient")

if not present then
  print "can't load impatient, please comment these lines and install it first"
  return
end
require("impatient")

require "core"
