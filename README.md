# My Neovim config written in Lua

## Try out this config


Prerequirements:
```
brew install fortune
cargo install stylua
```

Make sure to remove or move your current `nvim` directory

```
git clone https://github.com/andriisoldatenko/nvim ~/fan/nvim

# backup your current nvim

brew install stow

stow nvim -t $HOME/.config/nvim/
```
Run `nvim` and wait for the plugins to be installed 


**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

Migrate existing plugins to lua:

## Plugins
- File navigation with nvim-tree.lua
- Managing tabs, buffers with bufferline.nvim
- Beautiful and configurable icons with nvim-web-devicons
- Git diffs and more with gitsigns.nvim
- NeoVim Lsp configuration with nvim-lspconfig and lsp-installer
- Autocompletion with nvim-cmp
- File searching, previewing image and text files and more with telescope.nvim.
- Syntax highlighting with nvim-treesitter
- Autoclosing braces and html tags with nvim-autopairs
- Indentlines with indent-blankline.nvim
- Useful snippets with friendly snippets + LuaSnip.
- Popup mappings keysheet whichkey.nvim

### Spelling

More details you can find [here](https://neovim.io/doc/user/spell.html)

TODO:
- [x] Open line in Github (https://github.com/ruifm/gitlinker.nvim).
- [x] highlight line number when chnage line.
- [ ] https://github.com/wellle/targets.vim
- [ ] review lazy loading https://github.com/NvChad/NvChad
- [ ] review https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#highlight-symbol-under-cursor
- [ ] review https://github.com/Civitasv/runvim
- [ ] https://github.com/luukvbaal/stabilize.nvim

- [ ] https://github.com/Saecki/crates.nvim (Rust)
- [ ] https://github.com/gbprod/cutlass.nvim
- [ ] https://github.com/monaqa/dial.nvim
- [ ] stevearc/dressing.nvim
- [ ] https://github.com/j-hui/fidget.nvim
- [ ] https://github.com/unblevable/quick-scope
- [ ] https://github.com/tiagovla/scope.nvim
- [ ] https://github.com/stevearc/stickybuf.nvim
- [ ] https://github.com/abecodes/tabout.nvim
- [ ] https://github.com/ibhagwan/fzf-lua
- [ ] https://github.com/kevinhwang91/nvim-bqf
