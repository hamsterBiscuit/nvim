# nvim config

> 此配置来自于
> [ThinkVim](https://github.com/hardcoreplayers/ThinkVim)，可以认为本配置是
> ThinkVim 的私人定制版本。非常感谢 ThinkVim 作者开源的 vim 配置
> 现在配置全部基于 lua 重写，需要 neovim 5.0

PS: 目前 ThinkVim 已经不维护，大神目前在用的配置是这个[配置](https://github.com/glepnir/nvim)

## 特性

- [Shougo/dein.vim](https//github.com/Shougo/dein.vim) 管理插件
- [hrsh7th/nvim-compe](https://github.com/hrsh7th/nvim-compe) 提供补全
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) 提供 LSP
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) 提供 git 状态
- [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua) 提供标签页
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) 提供文件树
- [galaxyline](https://github.com/glepnir/galaxyline.nvim) 提供状态栏
- [dashboard](https://github.com/glepnir/dashboard-nvim) 提供首屏画面
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  [zephyr-nvim](https://github.com/glepnir/zephyr-nvim) 提供代码高亮和主题
- [telescope](https://github.com/nvim-telescope/telescope.nvim) 提供模糊搜索
- [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua) 提供颜色荧光笔
- [tyru/caw.vim](https://github.com/tyru/caw.vim) 注释插件
- [skywind3000/asynctasks.vim](https://github.com/skywind3000/asynctasks.vim) 任务系统

- [awesome-neovim](https://github.com/rockerBOO/awesome-neovim)

## Key

### Normal

| KeyMap       | Mode | Description                                               |
| ------------ | ---- | --------------------------------------------------------- |
| `j`          | N    | [accelerated-jk](https://github.com/rhysd/accelerated-jk) |
| `k`          | N    | [accelerated-jk](https://github.com/rhysd/accelerated-jk) |
| `Ctrl` + `s` | IN   | Save buffer                                               |
| `Ctrl` + `h` | I    | backspace                                                 |
| `Ctrl` + `d` | I    | delete                                                    |
| `Ctrl` + `S` | I    | Save buffer                                               |
| `Ctrl` + `Q` | I    | Save buffer and Quit                                      |
| `]` + `e`    | N    | Prev diagnostic                                           |
| `[` + `e`    | N    | Next diagnostic                                           |
| `[` + `g`    | N    | Prev git chunkinfo                                        |
| `[` + `g`    | N    | Next git chunkinfo                                        |
| `g` + `d`    | N    | Jump to definition                                        |
| `g` + `y`    | N    | Jump type definition                                      |
| `g` + `i`    | N    | Jump implementation                                       |
| `g` + `r`    | N    | rename                                                    |
| `K`          | N    | Show document                                             |

### Window

| KeyMap          | Mode | Description        |
| --------------- | ---- | ------------------ |
| `Ctrl` + `h`    | N    | jump left window   |
| `Ctrl` + `j`    | N    | jump bottom window |
| `Ctrl` + `k`    | N    | jump top window    |
| `Ctrl` + `l`    | N    | jump right window  |
| `Leader` + `ws` | N    | horizontally split |
| `Leader` + `wv` | N    | vertical split     |

### Find

| KeyMap          | Mode | Description       |
| --------------- | ---- | ----------------- |
| `Leader` + `fa` | N    | Find input char   |
| `Leader` + `ff` | N    | Find file         |
| `Leader` + `fh` | N    | Find history file |
| `Leader` + `bb` | N    | Find Buffer       |

### File

| KeyMap         | Mode | Description                   |
| -------------- | ---- | ----------------------------- |
| `Leader` + `e` | N    | Open file tree                |
| `Leader` + `F` | N    | Open file with current buffer |

### Vista

| KeyMap         | Mode | Description |
| -------------- | ---- | ----------- |
| `Leader` + `v` | N    | Open Vista  |

### Operator Surround

| KeyMap | Mode | Description               |
| ------ | ---- | ------------------------- |
| `sa`   | V    | operator-surround-append  |
| `sd`   | V    | operator-surround-delete  |
| `sr`   | V    | operator-surround-replace |

### AsyncTask

| KeyMap | Mode | Description             |
| ------ | ---- | ----------------------- |
| `F5`   | N    | AsyncTask file-run      |
| `F6`   | N    | AsyncTask project-run   |
| `F7`   | N    | AsyncTask project-build |
| `F9`   | N    | AsyncTask file-build    |
