return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- Use latest instead of pinning
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
		lazy = vim.fn.argc(-1) == 0, -- Load immediately if opening files
		init = function(plugin)
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treesitter** module to be loaded in time.
			-- Luckily, the only things that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<c-space>", desc = "Increment Selection" },
			{ "<bs>", desc = "Decrement Selection", mode = "x" },
		},
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"css",
				"diff",
				"dot",
				"gitignore",
				"html",
				"javascript",
				"json",
				"jsonc",
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
			},

			-- Performance optimizations
			auto_install = true,
			sync_install = false,

			-- Enhanced highlighting
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				-- Disable for very large files for performance
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},

			-- Smart indentation
			indent = {
				enable = true,
				disable = { "python", "yaml" },
			},

			-- Enhanced incremental selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},

		},
	},

	-- Additional syntax support
	{
		"nikvdp/ejs-syntax",
		ft = "ejs",
	},
}
