# My Neovim config written in Lua

---

## Installation

### 1. Prerequirements:
```
brew install neovim
brew install git
brew install ripgrep
brew install fd
brew install lazygit
brew install stow
brew install fortune
brew install cargo-binstall
cargo install stylua
cargo binstall tree-sitter-cli
luarocks install luafilesystem
```

### 2. Fonts (Required)


Install a [Nerd Font](https://www.nerdfonts.com/) for icons:

```bash
brew install --cask font-jetbrains-mono-nerd-font
# or
brew install --cask font-fira-code-nerd-font
```
Then set your terminal to use the installed font.


### 3. Language Toolchains

```bash
# Go
brew install go
# After install, run :GoInstallBinaries in nvim

# Lua (for luarocks, optional)
brew install lua luarocks
```

### 4. Optional Dependencies

```bash
# Markdown preview (browser-based)
# markdown-preview.nvim will auto-install, but needs npm
```


### 5. Clone and Start

> [!WARNING:]
> Make sure to remove or move your current `nvim` directory

```
git clone https://github.com/andriisoldatenko/nvim ~/fan/nvim

# backup your current nvim

brew install stow

stow nvim -t $HOME/.config/nvim/
```

### 6. Post install steps

Run `nvim`:

```bash
" Wait for lazy.nvim to finish installing plugins, then:

" Generate help tags
:helptags ALL

" Install treesitter parsers (auto-installs, but can force)
:TSUpdate

" Check health
:checkhealth

" For Go development
:GoInstallBinaries

" Build markdown-preview (if not auto-built)
:Lazy build markdown-preview.nvim
```

### 7. Verify installation

```vim
:checkhealth
```

All checks should pass. Common fixes:
- Missing CLI tools: `brew install <tool>`
- Treesitter errors: `:TSUpdate`
- LSP not working: `:LspInfo` and `:Mason`