return {
	"saghen/blink.cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"saghen/blink.compat",
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		{
			"moyiz/blink-emoji.nvim",

			config = function()
				-- Get the original module
				local emoji_source = require("blink-emoji")

				-- Override the get_trigger_characters function
				emoji_source.get_trigger_characters = function(self)
					return { ";" }
				end
			end,
		},
	},
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {

		-- Disable in DressingInput
		enabled = function()
			return not vim.tbl_contains({}, vim.bo.filetype)
				and vim.bo.buftype ~= "nofile"
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,

		keymap = {
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "hide", "fallback" },

			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },

			["<C-h>"] = { "scroll_documentation_up", "fallback" },
			["<C-l>"] = { "scroll_documentation_down", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = { documentation = { auto_show = false } },

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"otter",
				"emoji",
			},

			per_filetype = { markdown = { "obsidian", "obsidian_new", "obsidian_tags" } },

			providers = {
				emoji = {
					name = "emoji",
					module = "blink-emoji",
				},
				path = {
					opts = {
						get_cwd = function(_)
							return vim.fn.getcwd()
						end,
					},
				},
				otter = {
					name = "otter",
					module = "blink.compat.source",
				},
				obsidian = {
					name = "obsidian",
					module = "blink.compat.source",
				},
				obsidian_new = {
					name = "obsidian_new",
					module = "blink.compat.source",
				},
				obsidian_tags = {
					name = "obsidian_tags",
					module = "blink.compat.source",
				},
			},
		},
	},
}
