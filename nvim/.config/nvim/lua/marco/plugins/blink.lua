return {
	"saghen/blink.cmp",
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
	---
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		-- keymap = { preset = 'super-tab' },
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
        "path",
        "emoji",
			},

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
			},
		},
	},
}
