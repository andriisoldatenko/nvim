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

TODO:
- [x] Open line in Github (https://github.com/ruifm/gitlinker.nvim)
