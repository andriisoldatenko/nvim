local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua fuctwions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")
	use("ThePrimeagen/harpoon")
	use("MattesGroeger/vim-bookmarks")

	use("goolord/alpha-nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("folke/which-key.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")

	-- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
	use("tpope/vim-abolish")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("inkarkat/vim-ReplaceWithRegister")

	use("ghillb/cybu.nvim")

	-- Colorschemes
	use("ishan9299/nvim-solarized-lua")

	-- cmp plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("simrat39/symbols-outline.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("tom-anders/telescope-vim-bookmarks.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	--- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use({
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use("f-person/git-blame.nvim")

	-- Enables Vim to process line and column jump specifications in file paths
	use("wsdjeg/vim-fetch")

	-- Vim text objects
	use({ "beloglazov/vim-textobj-quotes", requires = "kana/vim-textobj-user" })

	-- plugin that peeks lines of the buffer in non-obtrusive way.
	use("nacro90/numb.nvim")

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
