return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {
			file_types = { "markdown", "quarto" },
			heading = {
				position = "inline",
				border = true,
				border_virtual = true,
			},
			indent = {
				enabled = true,
			},
			quote = {
				repeat_linebreak = true,
			},
			win_options = {
				showbreak = {
					default = "",
					rendered = "    ",
				},
				breakindent = {
					default = false,
					rendered = true,
				},
				breakindentopt = {
					default = "",
					rendered = "",
				},
			},
		},
	},
	{
		"tadmccorkle/markdown.nvim",
		ft = { "markdown", "quarto" },
		opts = {
			mappings = {
				go_curr_heading = "g.",
				go_parent_heading = "gp",
				go_next_heading = "]]",
				go_prev_heading = "[[",
			},
			on_attach = function(bufnr)
				local function toggle(key)
					return "<Esc>gv<Cmd>lua require'markdown.inline'" .. ".toggle_emphasis_visual'" .. key .. "'<CR>"
				end

				vim.keymap.set("x", "<C-b>", toggle("b"), { buffer = bufnr })
				vim.keymap.set("x", "<C-i>", toggle("i"), { buffer = bufnr })
			end,
		},
	},
	{
		"bullets-vim/bullets.vim",
		ft = { "markdown", "quarto" },
		init = function()
			vim.g.bullets_outline_levels = { "ROM", "ABC", "num", "abc", "rom", "std-" }
			vim.g.bullets_enabled_file_types = {
				"markdown",
				"quarto",
			}
			vim.g.bullets_set_mappings = 0
			vim.g.bullets_custom_mappings = {
				{ "imap", "<cr>", "<Plug>(bullets-newline)" },
				{ "nmap", "<leader>x", "<Plug>(bullets-toggle-checkbox)" },
				{ "nmap", ">>", "<Plug>(bullets-demote)" },
				{ "nmap", "<<", "<Plug>(bullets-promote)" },
			}
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown", "quarto" }
			vim.g.mkdp_auto_close = true
			vim.g.mkdp_open_to_the_world = false
			vim.g.mkdp_open_ip = "127.0.0.1"
			vim.g.mkdp_port = "8081"
			vim.g.mkdp_echo_preview_url = true
			vim.g.mkdp_page_title = "${name}"
		end,
		ft = { "markdown", "quarto" },
	},
}
