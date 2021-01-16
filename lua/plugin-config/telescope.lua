return function()
  require("telescope").setup {
    defaults = {
      prompt_position = "top"
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true
      }
    }
  }
  require("telescope").load_extension("fzy_native")
end