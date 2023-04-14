-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = true
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/zhangyongqi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/zhangyongqi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/zhangyongqi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/zhangyongqi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/zhangyongqi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugin-config.Comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["accelerated-jk.nvim"] = {
    config = { "\27LJ\2\n”\1\0\0\5\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\3\0005\4\b\0>\4\1\3=\3\t\2B\0\2\1K\0\1\0\23deceleration_table\1\3\0\0\3ñ\1\3èN\23acceleration_table\1\t\0\0\3\a\3\f\3\17\3\21\3\24\3\26\3\28\3\30\rmappings\1\0\1\23acceleration_limit\3ñ\1\1\0\2\6k\agk\6j\agj\nsetup\19accelerated-jk\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/accelerated-jk.nvim",
    url = "https://github.com/xiyaowong/accelerated-jk.nvim"
  },
  ["bufferline.nvim"] = {
    config = { 'require("plugin-config.bufferline")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after = { "cmp-cmdline" },
    after_files = { "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    after_files = { "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    after_files = { "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["dashboard-nvim"] = {
    config = { 'require("plugin-config.dashboard")' },
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["editorconfig-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    commands = { "Format" },
    config = { 'require("plugin-config.formatter")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { 'require("plugin-config.galaxyline")' },
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("plugin-config.gitsigns")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    commands = { "Glow" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/glow.nvim",
    url = "https://github.com/npxbr/glow.nvim"
  },
  ["hlsearch.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rhlsearch\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/hlsearch.nvim",
    url = "https://github.com/glepnir/hlsearch.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nó\4\0\0\4\0\n\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2D\0\2\0\21context_patterns\1\f\0\0\nclass\rfunction\vmethod\nblock\17list_literal\rselector\b^if\v^table\17if_statement\nwhile\bfor\20buftype_exclude\1\4\0\0\rterminal\vnofile\vprompt\21filetype_exclude\1\17\0\0\14dashboard\16DogicPrompt\blog\rfugitive\14gitcommit\vpacker\rmarkdown\tjson\btxt\nvista\thelp\ftodoist\rNvimTree\bgit\20TelescopePrompt\rundotree\1\0\6\25use_treesitter_scope\2\tchar\b‚îÇ/show_current_context_start_on_current_line\1\31show_current_context_start\1\25show_current_context\1\28show_first_indent_level\2\nsetup\21indent_blankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    keys = { { "", "<Plug>Lightspeed_s" }, { "", "<Plug>Lightspeed_S" }, { "", "<Plug>Lightspeed_x" }, { "", "<Plug>Lightspeed_X" }, { "", "<Plug>Lightspeed_f" }, { "", "<Plug>Lightspeed_F" }, { "", "<Plug>Lightspeed_t" }, { "", "<Plug>Lightspeed_T" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n∂\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\frounded\1\0\4\tbind\2\17hi_parameter LspSignatureActiveParameter\20floating_window\2\16hint_enable\1\nsetup\18lsp_signature\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { 'require("plugin-config.lspsaga")' },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lsp-signature-help", "cmp-vsnip", "vim-vsnip", "vim-vsnip-integ", "cmp-path", "cmp-buffer" },
    config = { 'require("plugin-config.nvim-cmp")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { 'require("plugin-config.nvim-colorizer")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-cursorline"] = {
    config = { 'require("plugin-config.nvim-cursorline")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-lastplace"] = {
    config = { "\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!plugin-config.nvim-lastplace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/nvim-lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  ["nvim-lspconfig"] = {
    after = { "lspsaga.nvim", "cmp-nvim-lsp" },
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14lsp.setup\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugin-config.nvim-notify\frequire\0" },
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!plugin-config.nvim-scrollbar\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = { 'require("plugin-config.nvim-tree")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "nvim-ts-context-commentstring", "spellsitter.nvim", "nvim-ts-rainbow" },
    config = { 'require("plugin-config.treesitter")' },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\19mappings_style\rsurround\nsetup\rsurround\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/surround.nvim",
    url = "https://github.com/ur4ltz/surround.nvim"
  },
  ["telescope.nvim"] = {
    after = { "nvim-treesitter" },
    commands = { "Telescope" },
    config = { 'require("plugin-config.telescope")' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    commands = { "ToggleTerm" },
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugin-config.toggleterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-dadbod"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUIToggle", "DBUIAddConnection", "DBUI", "DBUIFindBuffer", "DBUIRenameBuffer" },
    config = { 'require("plugin-config.dadod")' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-prettier"] = {
    commands = { "Prettier" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-vsnip"] = {
    config = { 'require("plugin-config.vsnip")' },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    after_files = { "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ/after/plugin/vsnip_integ.vim" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  },
  ["vim-vue-plugin"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/vim-vue-plugin",
    url = "https://github.com/leafOfTree/vim-vue-plugin"
  },
  ["zephyr-nvim"] = {
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vzephyr\frequire\0" },
    loaded = true,
    path = "/Users/zhangyongqi/.local/share/nvim/site/pack/packer/start/zephyr-nvim",
    url = "https://github.com/glepnir/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: lightspeed.nvim
time([[Setup for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\n≠\6\0\0\f\0\25\00084\0\21\0005\1\0\0>\1\1\0005\1\1\0>\1\2\0005\1\2\0>\1\3\0005\1\3\0>\1\4\0005\1\4\0>\1\5\0005\1\5\0>\1\6\0005\1\6\0>\1\a\0005\1\a\0>\1\b\0005\1\b\0>\1\t\0005\1\t\0>\1\n\0005\1\n\0>\1\v\0005\1\v\0>\1\f\0005\1\f\0>\1\r\0005\1\r\0>\1\14\0005\1\14\0>\1\15\0005\1\15\0>\1\16\0005\1\16\0>\1\17\0005\1\17\0>\1\18\0005\1\18\0>\1\19\0005\1\19\0>\1\20\0006\1\20\0\18\3\0\0B\1\2\4X\4\bÄ6\6\21\0009\6\22\0069\6\23\6:\b\1\5:\t\2\5:\n\3\0055\v\24\0B\6\5\1E\4\3\3R\4ˆ\127K\0\1\0\1\0\1\vsilent\2\20nvim_set_keymap\bapi\bvim\vipairs\1\4\0\0\6o\6T\23<Plug>Lightspeed_T\1\4\0\0\6o\6t\23<Plug>Lightspeed_t\1\4\0\0\6x\6T\23<Plug>Lightspeed_T\1\4\0\0\6x\6t\23<Plug>Lightspeed_t\1\4\0\0\6n\6T\23<Plug>Lightspeed_T\1\4\0\0\6n\6t\23<Plug>Lightspeed_t\1\4\0\0\6o\6F\23<Plug>Lightspeed_F\1\4\0\0\6o\6f\23<Plug>Lightspeed_f\1\4\0\0\6x\6F\23<Plug>Lightspeed_F\1\4\0\0\6x\6f\23<Plug>Lightspeed_f\1\4\0\0\6n\6F\23<Plug>Lightspeed_F\1\4\0\0\6n\6f\23<Plug>Lightspeed_f\1\4\0\0\6o\6X\23<Plug>Lightspeed_X\1\4\0\0\6o\6x\23<Plug>Lightspeed_x\1\4\0\0\6o\6Z\23<Plug>Lightspeed_S\1\4\0\0\6o\6z\23<Plug>Lightspeed_s\1\4\0\0\6x\6S\23<Plug>Lightspeed_S\1\4\0\0\6x\6s\23<Plug>Lightspeed_s\1\4\0\0\6n\6S\23<Plug>Lightspeed_S\1\4\0\0\6n\6s\23<Plug>Lightspeed_s\0", "setup", "lightspeed.nvim")
time([[Setup for lightspeed.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
require("plugin-config.galaxyline")
time([[Config for galaxyline.nvim]], false)
-- Config for: zephyr-nvim
time([[Config for zephyr-nvim]], true)
try_loadstring("\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vzephyr\frequire\0", "config", "zephyr-nvim")
time([[Config for zephyr-nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
require("plugin-config.dashboard")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugin-config.nvim-notify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DBUIAddConnection', function(cmdargs)
          require('packer.load')({'vim-dadbod-ui'}, { cmd = 'DBUIAddConnection', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dadbod-ui'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DBUIAddConnection ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DBUI', function(cmdargs)
          require('packer.load')({'vim-dadbod-ui'}, { cmd = 'DBUI', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dadbod-ui'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DBUI ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DBUIFindBuffer', function(cmdargs)
          require('packer.load')({'vim-dadbod-ui'}, { cmd = 'DBUIFindBuffer', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dadbod-ui'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DBUIFindBuffer ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DBUIRenameBuffer', function(cmdargs)
          require('packer.load')({'vim-dadbod-ui'}, { cmd = 'DBUIRenameBuffer', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dadbod-ui'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DBUIRenameBuffer ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Format', function(cmdargs)
          require('packer.load')({'formatter.nvim'}, { cmd = 'Format', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'formatter.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Format ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Prettier', function(cmdargs)
          require('packer.load')({'vim-prettier'}, { cmd = 'Prettier', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-prettier'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Prettier ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'DBUIToggle', function(cmdargs)
          require('packer.load')({'vim-dadbod-ui'}, { cmd = 'DBUIToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dadbod-ui'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DBUIToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Glow', function(cmdargs)
          require('packer.load')({'glow.nvim'}, { cmd = 'Glow', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'glow.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Glow ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeToggle', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeFindFile', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeFindFile', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeFindFile ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ToggleTerm', function(cmdargs)
          require('packer.load')({'toggleterm.nvim'}, { cmd = 'ToggleTerm', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'toggleterm.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ToggleTerm ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>Lightspeed_T <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_t <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_X <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_X", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_F <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_f <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_S <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_s <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Lightspeed_x <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "<lt>Plug>Lightspeed_x", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-lspconfig', 'vim-vue-plugin', 'editorconfig-vim', 'fidget.nvim'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType sass ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "sass" }, _G.packer_plugins)]]
vim.cmd [[au FileType less ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "less" }, _G.packer_plugins)]]
vim.cmd [[au FileType stylus ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "stylus" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'nvim-lspconfig', 'editorconfig-vim', 'fidget.nvim'}, { ft = "sh" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'surround.nvim', 'nvim-treesitter', 'neoscroll.nvim', 'nvim-cursorline', 'nvim-lastplace', 'gitsigns.nvim', 'Comment.nvim', 'nvim-scrollbar', 'hlsearch.nvim', 'accelerated-jk.nvim', 'indent-blankline.nvim', 'bufferline.nvim', 'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'surround.nvim', 'neoscroll.nvim', 'nvim-cursorline', 'nvim-lastplace', 'gitsigns.nvim', 'Comment.nvim', 'nvim-scrollbar', 'accelerated-jk.nvim', 'indent-blankline.nvim', 'bufferline.nvim', 'nvim-colorizer.lua'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'FixCursorHold.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp', 'lsp_signature.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/vim-vue-plugin/ftdetect/vue.vim]], true)
vim.cmd [[source /Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/vim-vue-plugin/ftdetect/vue.vim]]
time([[Sourcing ftdetect script at: /Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/vim-vue-plugin/ftdetect/vue.vim]], false)
time([[Sourcing ftdetect script at: /Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/editorconfig-vim/ftdetect/editorconfig.vim]], true)
vim.cmd [[source /Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/editorconfig-vim/ftdetect/editorconfig.vim]]
time([[Sourcing ftdetect script at: /Users/zhangyongqi/.local/share/nvim/site/pack/packer/opt/editorconfig-vim/ftdetect/editorconfig.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
