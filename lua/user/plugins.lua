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
	snapshot_path = fn.stdpath("config") .. "/snapshots",
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded", -- Border style of prompt popups.
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Plugin Mangager
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- Lua Development
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua fuctwions used ny lots of plugins
	use("christianchiarulli/lua-dev.nvim")

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	-- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("ray-x/lsp_signature.nvim")
	use("SmiteshP/nvim-navic")
	use({ "simrat39/symbols-outline.nvim", branch = "rework" })
	use("b0o/SchemaStore.nvim")
	-- use "github/copilot.vim"
	use("RRethy/vim-illuminate")
	use("j-hui/fidget.nvim")
	use({ "lvimuser/lsp-inlayhints.nvim" })
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")

	-- Plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("akinsho/toggleterm.nvim")
	use("ThePrimeagen/harpoon")
	use("MattesGroeger/vim-bookmarks")
	use("folke/todo-comments.nvim")
	use("goolord/alpha-nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("folke/which-key.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use({ "nyngwang/NeoZoom.lua", branch = "neo-zoom-original" })
	use("christianchiarulli/hop.nvim")
	use("andymass/vim-matchup")
	use("windwp/nvim-spectre")
	use("tversteeg/registers.nvim")
	use("karb94/neoscroll.nvim")
	use("junegunn/vim-slash")
	-- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
	use("tpope/vim-abolish")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("inkarkat/vim-ReplaceWithRegister")
	use("godlygeek/tabular")
	use("norcalli/nvim-colorizer.lua")
	use("nvim-colortils/colortils.nvim")
	use("ghillb/cybu.nvim")
	use("dstein64/vim-startuptime")
	use("takac/vim-hardtime")
	use("dhruvasagar/vim-table-mode")
	--[[ use("rmagatti/auto-session") ]]
	--[[ use("rmagatti/session-lens") ]]

	-- Colorschemes
	use("ishan9299/nvim-solarized-lua")

	-- Status line
	use("nvim-lualine/lualine.nvim")

	-- cmp plugins
	use("christianchiarulli/nvim-cmp")
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Rust
	use({ "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" })

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
	})

	-- Fzf
	use({
		"ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("tom-anders/telescope-vim-bookmarks.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("lalitmee/browse.nvim")

	--- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	-- use("RRethy/nvim-treesitter-textsubjects")
  use("Julian/vim-textobj-variable-segment")
	use("nvim-treesitter/nvim-treesitter-context")
	use("drybalka/tree-climber.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use({
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use("f-person/git-blame.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Enables Vim to process line and column jump specifications in file paths
	use("wsdjeg/vim-fetch")

	-- Vim text objects
	use({ "beloglazov/vim-textobj-quotes", requires = "kana/vim-textobj-user" })

	-- plugin that peeks lines of the buffer in non-obtrusive way.
	use("nacro90/numb.nvim")

	-- folding
	use("kalekundert/vim-coiled-snake")

	-- todo
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
