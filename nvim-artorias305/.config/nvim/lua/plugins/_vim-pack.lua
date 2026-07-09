-- Plugins to load
vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },

	-- LSP
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" }, -- automatically enable servers installed by mason
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" }, -- automatically enable servers installed by mason

	-- Luasnip
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/archie-judd/blink-cmp-words" },
	{ src = "https://github.com/saghen/blink.cmp", version = "v1.8.0" },

	-- Mini
	{ src = "https://github.com/nvim-mini/mini.nvim" },

	-- Treesitter
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
	},

	-- Conform for linting
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- { src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/SmiteshP/nvim-navic" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" }, -- Required by nvim-navbuddy
	{ src = "https://github.com/hasansujon786/nvim-navbuddy" }, -- fork from SmitheshP
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/lervag/vimtex" },
	{ src = "https://github.com/chentoast/marks.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/opdavies/toggle-checkbox.nvim" },
	{ src = "https://github.com/folke/trouble.nvim" },
})
