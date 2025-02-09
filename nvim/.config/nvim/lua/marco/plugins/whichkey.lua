return {
	"folke/which-key.nvim",
  commit = "f5b912451f33fd19e52230e73617ad099ffd3ab1",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		--  ┌────────────────────────────────────────────────────────────────────┐
		--                                  SETUP
		--  └────────────────────────────────────────────────────────────────────┘
		local setup = {
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = false, -- adds help for operators like d, y, ...
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			-- add operators that will trigger motion and text object completion
			-- to enable all native operators, set the preset / operators plugin above
			operators = { gc = "Comments" },
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				-- ["<space>"] = "SPC",
				-- ["<cr>"] = "RET",
				-- ["<tab>"] = "TAB",
			},
			motions = {
				count = true,
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			popup_mappings = {
				scroll_down = "<c-d>", -- binding to scroll down inside the popup
				scroll_up = "<c-u>", -- binding to scroll up inside the popup
			},
			window = {
				border = "none", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
			ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
			show_help = true, -- show a help message in the command line for using WhichKey
			show_keys = true, -- show the currently pressed key and its label as a message in the command line
			triggers = "auto", -- automatically setup triggers
			-- triggers = {"<leader>"} -- or specifiy a list manually
			-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
			triggers_nowait = {
				-- marks
				"`",
				"'",
				"g`",
				"g'",
				-- registers
				'"',
				"<c-r>",
				-- spelling
				"z=",
			},
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for keymaps that start with a native binding
				n = { "v" },
				i = { "j", "k" },
				v = { "j", "k" },
			},
			-- disable the WhichKey popup for certain buf types and file types.
			-- Disabled by default for Telescope
			disable = {
				buftypes = {},
				filetypes = {},
			},
		}
		--  ┌────────────────────────────────────────────────────────────────────┐
		--                                 OPTIONS
		--  └────────────────────────────────────────────────────────────────────┘
		local nopts = {
			mode = "n", -- NORMAL mode
			-- prefix: use "<leader>f" for example for mapping everything related to finding files
			-- the prefix is prepended to every mapping part of `mappings`
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = false, -- use `nowait` when creating keymaps
			expr = false, -- use `expr` when creating keymaps
		}

		--  ┌────────────────────────────────────────────────────────────────────┐
		--                                 MAPPINGS
		--  └────────────────────────────────────────────────────────────────────┘
		--  ┌────────────────────────────────────────────────────────────────────┐
		--                               Normal Mode
		--  └────────────────────────────────────────────────────────────────────┘
		local n_mappings = {
			-- NVIMTREE
			["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

      -- TELESCOPE
			["f"] = {
				"<cmd>Telescope find_files<CR>",
				"Find files",
			},
			["F"] = {
				"<cmd>Telescope live_grep<CR>",
				"Find Text",
			},
			["b"] = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
				"Buffers",
			},

			-- LAZY
			["L"] = { "<cmd>Lazy<CR>", "Lazy" },

			-- C KEY
			c = {
				b = {
					name = "Comment Box",
					l = {
						name = "Left aligned box",
						l = { "<cmd>CBllbox<CR>", "Left aligned text" },
						c = { "<cmd>CBlcbox<CR>", "Center aligned text" },
						r = { "<cmd>CBlrbox<CR>", "Right aligned text" },
					},
					c = {
						name = "Center aligned box",
						l = { "<cmd>CBclbox<CR>", "Left aligned text" },
						c = { "<cmd>CBccbox<CR>", "Center aligned text" },
						r = { "<cmd>CBcrbox<CR>", "Right aligned text" },
					},
					r = {
						name = "Right aligned box",
						l = { "<cmd>CBrlbox<CR>", "Left aligned text" },
						c = { "<cmd>CBrcbox<CR>", "Center aligned text" },
						r = { "<cmd>CBrrbox<CR>", "Right aligned text" },
					},
				},
			},
    }
		--  ┌────────────────────────────────────────────────────────────────────┐
		--                               Visual Mode
		--  └────────────────────────────────────────────────────────────────────┘
		--  ┌────────────────────────────────────────────────────────────────────┐
		--                                  SETUP
		--  └────────────────────────────────────────────────────────────────────┘
		local which_key = require("which-key")

		which_key.setup(setup)
		which_key.register(n_mappings, nopts)
		which_key.register(v_mappings, vopts)
	end,
}
