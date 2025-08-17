return {
	-- ─────────────────────────────────────────────────────────────────────
	--   Noice: Better UI for LSP, messages, and command-line UI
	-- ─────────────────────────────────────────────────────────────────────
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lsp = {
				signature = { auto_open = false },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			views = {
				mini = {
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winblend = 0,
					},
				},
			},
		},
		keys = {
			{
				"<C-f>",
				function()
					if not require("noice.lsp").scroll(4) then
						return "<C-f>"
					end
				end,
				silent = true,
				expr = true,
				desc = "Noice Scroll Forward",
				mode = { "i", "n", "s" },
			},
			{
				"<C-b>",
				function()
					if not require("noice.lsp").scroll(-4) then
						return "<C-b>"
					end
				end,
				silent = true,
				expr = true,
				desc = "Noice Scroll Backward",
				mode = { "i", "n", "s" },
			},
		},
	},

	-- ─────────────────────────────────────────────────────────────────────
	--   Notify: Clean, minimal notifications
	-- ─────────────────────────────────────────────────────────────────────
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {
			stages = "static",
			timeout = 2000,
			fps = 60,
			render = "compact",
			background_colour = "#000000",
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 200 })
			end,
		},
  },
}
