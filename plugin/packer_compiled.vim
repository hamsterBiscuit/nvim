" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif
try

lua << END
local plugins = {
  ["accelerated-jk"] = {
    keys = { { "", "j" }, { "", "k" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/accelerated-jk"
  },
  ["auto-pairs"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/auto-pairs"
  },
  ["caw.vim"] = {
    keys = { { "", "gcc" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/caw.vim"
  },
  ["context_filetype.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/context_filetype.vim"
  },
  ["emmet-vim"] = {
    config = { "\27LJ\2\n∞\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0K\0\1\0\6i\20user_emmet_mode\31user_emmet_install_command\30user_emmet_install_global\28user_emmet_complete_tag\6g\bvim\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["formatter.nvim"] = {
    commands = { "Format" },
    config = { "\27LJ\2\nÄ\1\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\21--stdin-filepath\1\0\2\nstdin\2\bexe\rprettier\5ÄÄ¿ô\4N\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\nstdin\2\bexe\vluafmtå\1\1\0\6\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0004\4\3\0003\5\4\0>\5\1\4=\4\6\0034\4\3\0003\5\a\0>\5\1\4=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rfiletype\blua\0\15javascript\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/formatter.nvim"
  },
  ["indent-guides.nvim"] = {
    config = { "\27LJ\2\nì\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\22exclude_filetypes\1\0\0\1\a\0\0\thelp\14dashboard\16dashpreview\fLuaTree\nvista\14sagahover\nsetup\18indent_guides\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/indent-guides.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\nË\1\0\0\5\0\v\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\n\0'\2\b\0B\0\2\1K\0\1\0\19load_extension\15extensions\15fzy_native\1\0\0\1\0\2\25override_file_sorter\2\28override_generic_sorter\1\rdefaults\1\0\0\1\0\1\20prompt_position\btop\nsetup\14telescope\frequire\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-cursorword"] = {
    config = { "\27LJ\2\nª\3\0\0\3\0\n\0$6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\b\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0B\0\2\1K\0\1\0\16augroup END/autocmd InsertLeave * let b:cursorword = 1/autocmd InsertEnter * let b:cursorword = 0Gautocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endifFautocmd FileType defx,denite,fern,clap,vista let b:cursorword = 0\rautocmd!#augroup user_plugin_cursorword\17nvim_command\bapi\bvim\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/vim-cursorword"
  },
  ["vim-eft"] = {
    keys = { { "", "f" } },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/vim-eft"
  },
  ["vim-prettier"] = {
    commands = { "Prettier" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/vim-prettier"
  },
  ["vim-signify"] = {
    config = { "\27LJ\2\nŸ\1\0\0\2\0\t\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\3\0=\1\5\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0)\1\0\0=\1\b\0K\0\1\0\28signify_sign_show_count\b‚ñò#signify_sign_delete_first_line\24signify_sign_delete\24signify_sign_change\b‚ñã\21signify_sign_add\6g\bvim\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/vim-signify"
  },
  ["vim-smoothie"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/vim-smoothie"
  },
  ["vim-vsnip"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/yongqi/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

local packer_load = nil
local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    packer_load({name}, {})
  end
end

packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    local escaped_keys = vim.api.nvim_replace_termcodes(cause.keys .. extra, true, true, true)
    vim.api.nvim_feedkeys(escaped_keys, 'm', true)
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

_packer_load_wrapper = function(names, cause)
  success, err_msg = pcall(packer_load, names, cause)
  if not success then
    vim.cmd('echohl ErrorMsg')
    vim.cmd('echomsg "Error in packer_compiled: ' .. vim.fn.escape(err_msg, '"') .. '"')
    vim.cmd('echomsg "Please check your config for correctness"')
    vim.cmd('echohl None')
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Config for: zephyr-nvim
loadstring("\27LJ\2\nÕ\2\0\0\6\0\f\0!6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\3\0009\1\4\0019\1\5\1'\3\6\0009\4\a\0'\5\b\0&\3\5\3B\1\2\0016\1\3\0009\1\4\0019\1\5\1'\3\t\0009\4\n\0'\5\b\0&\3\5\3B\1\2\0016\1\3\0009\1\4\0019\1\5\1'\3\v\0009\4\n\0'\5\b\0&\3\5\3B\1\2\1K\0\1\0&highlight htmlTag gui=NONE guifg=\tblue&highlight htmlArg gui=NONE guifg=\27 guibg=NONE cterm=bold\vorange*highlight htmlTagName gui=bold guifg=\17nvim_command\bapi\bvim\21get_zephyr_color\vzephyr\frequire\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\2\nõ\3\0\0\6\0\19\0\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\4\0B\0\2\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\b\0005\3\t\0=\3\n\0025\3\v\0=\3\f\0025\3\16\0005\4\r\0005\5\14\0=\5\15\4=\4\17\3=\3\18\2B\0\2\1K\0\1\0\16textobjects\vselect\1\0\0\fkeymaps\1\0\4\aac\17@class.outer\aif\20@function.inner\aic\17@class.inner\aaf\20@function.outer\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire,set foldexpr=nvim_treesitter#foldexpr()\24set foldmethod=expr\17nvim_command\bapi\bvim\0")()
-- Config for: nvim-bufferline.lua
loadstring("\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\2\rmappings\2\27always_show_bufferline\1\nsetup\15bufferline\frequire\0")()
-- Config for: dashboard-nvim
loadstring("\27LJ\2\nâ\4\0\0\4\0\18\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\n\0005\2\b\0005\3\a\0=\3\t\2=\2\v\0015\2\r\0005\3\f\0=\3\t\2=\2\14\0015\2\16\0005\3\15\0=\3\t\2=\2\17\1=\1\6\0K\0\1\0\rnew_file\1\0\1\fcommand\21DashboardNewFile\1\2\0\0009Ôúï  New   File                              SPC t f\14find_file\1\0\1\fcommand\22DashboardFindFile\1\2\0\0009ÔÖú  Find  File                              SPC f f\17find_history\1\0\0\16description\1\0\1\fcommand\25DashboardFindHistory\1\2\0\0009Ôú°  Recently opened files                   SPC f h\29dashboard_custom_section\14telescope dashboard_default_executive\17commicgirl10\29dashboard_default_header\6g\bvim\0")()
-- Config for: vim-gutentags
loadstring("\27LJ\2\n§\3\0\0\4\0\14\0\0306\0\0\0009\0\1\0006\1\3\0009\1\4\1'\3\5\0B\1\2\2'\2\6\0&\1\2\1=\1\2\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0006\0\0\0009\0\1\0)\1\0\0=\1\t\0006\0\0\0009\0\1\0)\1\0\0=\1\n\0006\0\0\0009\0\1\0)\1\0\0=\1\v\0006\0\0\0009\0\1\0005\1\r\0=\1\f\0K\0\1\0\1\5\0\0\tdefx\vdenite\nvista\nmagit gutentags_exclude_filetypes\30gutentags_generate_on_new\"gutentags_generate_on_missing gutentags_generate_on_write\1\t\0\0\n.root\t.git\t.svn\r.project\vgo.mod\16.Cargo.toml\16tsconfig.js\16jsconfig.js\27gutentags_project_root\21/.cache/vim/tags\tHOME\vgetenv\aos\24gutentags_cache_dir\6g\bvim\0")()
-- Config for: vista.vim
loadstring("\27LJ\2\nÎ\2\0\0\2\0\v\0\0216\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0006\0\0\0009\0\1\0005\1\n\0=\1\t\0K\0\1\0\1\0\a\bvue\rnvim_lsp\20typescriptreact\rnvim_lsp\15typescript\rnvim_lsp\vpandoc\rmarkdown\fvimwiki\rmarkdown\rmarkdown\fvim_lsp\blua\rnvim_lsp\24vista_executive_for\rmarkdown\28vista_vimwiki_executive\vscroll\31vista_echo_cursor_strategy\nctags\28vista_default_executive\29vista_disable_statusline\6g\bvim\0")()
-- Config for: bubbly.nvim
loadstring("\27LJ\2\nÍ\1\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\f\bred\f#ec7279\rdarkgrey\f#404247\nblack\f#3e4249\14lightgrey\f#57595e\15foreground\f#c5cdd9\nwhite\f#c5cdd9\15background\f#34343c\tcyan\f#5dbbc1\vpurple\f#d38aea\tblue\f#6cb6eb\vyellow\f#deb974\ngreen\f#a0c980\19bubbly_palette\6g\bvim\0")()
-- Config for: nvim-tree.lua
loadstring("\27LJ\2\n”\3\0\0\3\0\16\0%6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0005\1\n\0005\2\t\0=\2\v\1=\1\b\0006\0\0\0009\0\1\0005\1\r\0005\2\14\0=\2\15\1=\1\f\0K\0\1\0\bgit\1\0\5\runmerged\b‚â†\vstaged\b‚úö\runstaged\b‚úö\14untracked\b‚òÖ\frenamed\b‚â´\1\0\2\fsymlink\bÔíÅ\fdefault\bÔÖú\20nvim_tree_icons\tedit\1\0\2\15edit_split\6i\16edit_vsplit\6s\1\3\0\0\t<CR>\6l\23nvim_tree_bindings\27nvim_tree_allow_resize\23nvim_tree_tab_open\21nvim_tree_git_hl\27nvim_tree_quit_on_open\25nvim_tree_auto_close\29nvim_tree_indent_markers\6g\bvim\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
  call luaeval('_packer_load_wrapper(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file Format call s:load(['formatter.nvim'], { "cmd": "Format", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Telescope call s:load(['telescope.nvim'], { "cmd": "Telescope", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Prettier call s:load(['vim-prettier'], { "cmd": "Prettier", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads
noremap <silent> f <cmd>call <SID>load(['vim-eft'], { "keys": "f", "prefix": "" })<cr>
noremap <silent> k <cmd>call <SID>load(['accelerated-jk'], { "keys": "k", "prefix": "" })<cr>
noremap <silent> j <cmd>call <SID>load(['accelerated-jk'], { "keys": "j", "prefix": "" })<cr>
noremap <silent> gcc <cmd>call <SID>load(['caw.vim'], { "keys": "gcc", "prefix": "" })<cr>

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType css ++once call s:load(['nvim-colorizer.lua', 'emmet-vim'], { "ft": "css" })
  au FileType sass ++once call s:load(['nvim-colorizer.lua'], { "ft": "sass" })
  au FileType scss ++once call s:load(['nvim-colorizer.lua'], { "ft": "scss" })
  au FileType vim ++once call s:load(['nvim-colorizer.lua'], { "ft": "vim" })
  au FileType javascriptreact ++once call s:load(['nvim-colorizer.lua', 'emmet-vim'], { "ft": "javascriptreact" })
  au FileType typescript ++once call s:load(['nvim-colorizer.lua', 'emmet-vim'], { "ft": "typescript" })
  au FileType typescriptreact ++once call s:load(['nvim-colorizer.lua', 'emmet-vim'], { "ft": "typescriptreact" })
  au FileType vue ++once call s:load(['nvim-colorizer.lua', 'emmet-vim'], { "ft": "vue" })
  au FileType lua ++once call s:load(['nvim-colorizer.lua'], { "ft": "lua" })
  au FileType markdown ++once call s:load(['markdown-preview.nvim'], { "ft": "markdown" })
  au FileType javascript ++once call s:load(['nvim-colorizer.lua', 'emmet-vim'], { "ft": "javascript" })
  au FileType html ++once call s:load(['nvim-colorizer.lua', 'emmet-vim'], { "ft": "html" })
  " Event lazy-loads
  au BufNewFile * ++once call s:load(['vim-cursorword', 'auto-pairs', 'vim-smoothie', 'vim-signify'], { "event": "BufNewFile *" })
  au InsertCharPre * ++once call s:load(['vim-vsnip', 'vim-vsnip-integ'], { "event": "InsertCharPre *" })
  au InsertEnter * ++once call s:load(['emmet-vim'], { "event": "InsertEnter *" })
  au BufReadPre * ++once call s:load(['vim-cursorword', 'auto-pairs', 'context_filetype.vim', 'indent-guides.nvim', 'vim-smoothie', 'vim-signify'], { "event": "BufReadPre *" })
  " Function lazy-loads
augroup END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
