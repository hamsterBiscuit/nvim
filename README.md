# nvim config

> 此配置来自于
> [ThinkVim](https://github.com/hardcoreplayers/ThinkVim)，可以认为本配置是
> ThinkVim 的私人定制版本。非常感谢 ThinkVim 作者开源的 vim 配置
现在配置全部基于 lua 重写，需要 neovim 5.0

## 特性

- [packer](https//github.com/wbthomason/packer.nvim) 管理插件
- [completion-nvim](https://github.com/nvim-lua/completion-nvim) 提供补全
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) 提供LSP
- [vim-signify](https://github.com/mhinz/vim-signify) 提供git 状态
- [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua) 提供标签页
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) 提供文件树
- [galaxyline](https://github.com/glepnir/galaxyline.nvim) 提供状态栏
- [dashboard](https://github.com/glepnir/dashboard-nvim) 提供首屏画面
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
	[zephyr-nvim](https://github.com/glepnir/zephyr-nvim) 提供代码高亮和主题
- [telescope](https://github.com/nvim-telescope/telescope.nvim) 提供模糊搜索
- [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)
	提供颜色荧光笔

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

| KeyMap         | Mode | Description                        |
| -------------- | ---- | ---------------------------------- |
| `Leader` + `e` | N    | Open defx file tree                |
| `Leader` + `F` | N    | Open defx file with current buffer |

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
