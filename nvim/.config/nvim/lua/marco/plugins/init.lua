return {
	"nvim-lua/plenary.nvim",

	--Tmux and Window Navigation
	"christoomey/vim-tmux-navigator",

	-- Vim Floaterm
	"voldikss/vim-floaterm",

	-- Repeat with .
	"tpope/vim-repeat",

	-- Kitty Config Highlighting
	"fladson/vim-kitty",

	-- Dressing
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	-- vim-python-pep8-indent
	{ "Vimjas/vim-python-pep8-indent" },

	-- Mini Surround
	{
		"echasnovski/mini.surround",
		version = "*",
		config = true,
	},

	-- grug-far
	{ "MagicDuck/grug-far.nvim", cmd = "GrugFar" },

	-- devicons
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").set_icon({
				gql = {
					icon = "",
					color = "#e535ab",
					cterm_color = "199",
					name = "GraphQL",
				},
			})
		end,
	},
}
