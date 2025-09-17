return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local actions_layout = require("telescope.actions.layout")

		telescope.setup({
			defaults = {
				-- Modern, beautiful prompt styling
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",

				-- Better sorting and performance
				sorting_strategy = "ascending",
				selection_strategy = "reset",
				scroll_strategy = "cycle",

				-- Clean layout
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.90,
					height = 0.85,
					preview_cutoff = 120,
				},

				-- Smart path display
				path_display = { "truncate" },

				-- Performance optimizations
				cache_picker = {
					num_pickers = 5,
				},
				dynamic_preview_title = true,

				-- File filtering
				file_ignore_patterns = {
					"node_modules",
					".git/",
					"site_libs",
					".venv",
					"_cache",
				},

				mappings = {
					i = {
						-- Navigation
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<esc>"] = actions.close,

						-- Preview
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<M-p>"] = actions_layout.toggle_preview,

						-- Multi-selection
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = false,
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						"!.git/*",
						"--follow",
						"--no-ignore-vcs",
					},
				},

				-- Search pickers
				live_grep = {
					theme = "ivy",
					layout_config = {
						height = 0.4,
					},
					additional_args = function()
						return { "--hidden", "--glob", "!.git/*" }
					end,
				},

				grep_string = {
					theme = "ivy",
					layout_config = {
						height = 0.4,
					},
				},

				-- Buffer management
				buffers = {
					theme = "dropdown",
					previewer = false,
					initial_mode = "normal",
					sort_mru = true,
					sort_lastused = true,
					layout_config = {
						width = 0.6,
						height = 0.6,
					},
				},

				-- Development
				lsp_references = {
					theme = "ivy",
					layout_config = { height = 0.4 },
				},

				lsp_definitions = {
					theme = "ivy",
					layout_config = { height = 0.4 },
				},

				diagnostics = {
					theme = "ivy",
					layout_config = { height = 0.4 },
				},

				-- Git
				git_files = {
					theme = "dropdown",
					previewer = false,
					layout_config = {
						width = 0.6,
						height = 0.6,
					},
				},

				git_commits = {
					theme = "ivy",
				},

				git_bcommits = {
					theme = "ivy",
				},

				-- Help and commands
				help_tags = {
					theme = "ivy",
				},

				commands = {
					theme = "ivy",
				},

				command_history = {
					theme = "ivy",
				},

				-- Colorscheme with beautiful preview
				colorscheme = {
					enable_preview = true,
					theme = "dropdown",
					layout_config = {
						width = 0.5,
						height = 0.5,
					},
				},
			},

			-- Extensions configuration
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- "smart_case" | "ignore_case" | "respect_case"
				},
			},
		})

		-- Load extensions
		telescope.load_extension("fzf")
	end,
}
