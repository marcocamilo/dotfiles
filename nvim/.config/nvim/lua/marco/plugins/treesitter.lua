return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",
		config = function()
			local treesitter = require("nvim-treesitter")
			local parsers = {
				"bash",
				"c",
				"css",
				"diff",
				"dot",
				"gitignore",
				"html",
				"javascript",
				"json",
				"latex",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"r",
				"regex",
				"terraform",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
			}

			treesitter.setup()

			vim.defer_fn(function()
				require("nvim-treesitter").install(parsers):wait(300000)
			end, 0)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = parsers,
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},

	-- Additional syntax support
	{
		"nikvdp/ejs-syntax",
		ft = "ejs",
	},

	-- Treesitter context
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPost",
		opts = {
			mode = "cursor",
			max_lines = 3,
		},
	},
}
