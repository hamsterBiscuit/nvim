# nvim

nvim config

> 此配置来自于
> [ThinkVim](https://github.com/hardcoreplayers/ThinkVim)，可以认为本配置是
> ThinkVim 的私人定制版本。非常感谢 ThinkVim 作者开源的 vim 配置
> 现在配置全部基于 lua 重写，需要 neovim 6.0

PS: 目前 ThinkVim 已经不维护，大神目前在用的配置是这个[配置](https://github.com/glepnir/nvim)

## Table of Contents

1. [特性](#特性)
2. [key](#key)
   1. [Normal](#Normal)
   2. [Window](#Window)
   3. [Find](#Find)
   4. [File](#File)
   5. [Outline](#Outline)
   6. [Operator Surround](#Operator-Surround)
   8. [Lightspeed](#Lightspeed)

![Snipaste_2021-03-24_23-27-05](https://user-images.githubusercontent.com/19209958/112338634-ea43f680-8cf9-11eb-8df9-04f9d9a11532.png)

## 特性

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [nvim-comment](https://github.com/terrortylor/nvim-comment)

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

### Outline

| KeyMap         | Mode | Description  |
| -------------- | ---- | ------------ |
| `Leader` + `v` | N    | Open Outline |

### Operator Surround

| KeyMap | Mode | Description               |
| ------ | ---- | ------------------------- |
| `sa`   | V    | operator-surround-append  |
| `sd`   | V    | operator-surround-delete  |
| `sr`   | V    | operator-surround-replace |

### Lightspeed

| KeyMap | Mode | Description |
| ------ | ---- | ----------- |
| `s`    | N    | Search Word |

