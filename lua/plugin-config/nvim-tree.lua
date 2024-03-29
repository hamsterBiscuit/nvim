vim.g.nvim_tree_allow_resize = 1

local function on_attach(bufnr)
  local api = require('nvim-tree.api')
  local function opts(desc)
    return {desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
  end
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
end

require("nvim-tree").setup {
  on_attach = on_attach,
  disable_netrw = false,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  "
      }
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = ""
        },
        git = {
          deleted = "",
          ignored = "",
          renamed = "",
          staged = "",
          unmerged = "",
          unstaged = "",
          untracked = "ﲉ"
        }
      }
    },
    special_files = {"Cargo.toml", "Makefile", "README.md", "readme.md"}
  },
  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  hijack_directories = {
    enable = true,
    auto_open = true
  },
  filters = {
    dotfiles = false,
    custom = {".DS_Store", "node_modules"},
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame"},
          buftype = {"nofile", "terminal", "help"}
        }
      }
    }
  }
}

vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
    pattern = "NvimTree_*",
    callback = function()
      local layout = vim.api.nvim_call_function("winlayout", {})
      if
        layout[1] == "leaf" and
          vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and
          layout[3] == nil
       then
        vim.cmd("confirm quit")
      end
    end
  }
)
