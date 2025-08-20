return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- Modern which-key v3 configuration
		preset = "modern",
		delay = 300, -- Delay before showing the popup

		-- Plugin integrations
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
	},
	-- Window configuration
	win = {
		border = "none",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 1, 2, 1, 2 },
		winblend = 0,
		zindex = 1000,
	},
	-- Layout settings
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
	-- Trigger configuration
	triggers = {
		{ "<auto>", mode = "nixsotc" },
		{ "s", mode = { "n", "v" } },
	},
	-- Modern spec-based configuration
	config = function()
		local wk = require("which-key")

		-- Normal mode mappings with <leader>
		wk.add({
			-- File operations
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
			{ "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Find files" },
			{ "<leader>F", "<cmd>Telescope live_grep<CR>", desc = "Find Text" },
			{
				"<leader>b",
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
				desc = "Buffers",
			},

			-- Quick access
			{ "<leader>L", "<cmd>Lazy<CR>", desc = "Lazy" },
			{ "<leader>M", "<cmd>Mason<CR>", desc = "Mason" },
			{ "<leader>lg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },

			-- Markdown
			{ "<leader>m", group = "Markdown" },
			{ "<leader>mv", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown Preview" },
			{ "<leader>mh", "<cmd>MarkdownHeaders<CR>", desc = "Markdown Headers" },
			{ "<leader>mt", "<cmd>MDInsertToc<CR>", desc = "Insert TOC" },

			-- Obsidian
			{ "<leader>n", group = "Obsidian" },
			{ "<leader>nn", "<cmd>ObsidianNew<CR>", desc = "Create New Note" },
			{ "<leader>nb", "<cmd>ObsidianBacklinks<CR>", desc = "Note Backlinks" },
			{ "<leader>ns", "<cmd>ObsidianSearch<CR>", desc = "Note Search" },

			-- LSP
			{ "<leader>l", group = "LSP" },
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
			{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Buffer Diagnostics" },
			{ "<leader>lD", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Line Diagnostics" },
			{ "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
			{ "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format buffer" },
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
			{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
			{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
			{ "<leader>lR", "<cmd>LspRestart<CR>", desc = "Restart LSP" },
			{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
			{ "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
			{ "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type Definitions" },
			{ "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
			{ "<leader>lg", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to Definition" },
			{ "<leader>lx", "<cmd>LspStop<cr>", desc = "LSP Stop" },
			{ "<leader>lo", "<cmd>LspStart<cr>", desc = "LSP Start" },

			-- Messages
			{ "<leader>;", group = "Messages" },
			{ "<leader>;h", "<cmd>Telescope notify<cr>", desc = "Notifications" },
			{ "<leader>;a", "<cmd>Noice all<cr>", desc = "All messages" },
			{ "<leader>;e", "<cmd>Noice errors<cr>", desc = "Errors only" },
			{ "<leader>;d", "<cmd>Noice dismiss<cr>", desc = "Dismiss all" },

			-- Search group
			{ "<leader>?", group = "Search" },
			{ "<leader>?c", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
			{ "<leader>?h", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
			{ "<leader>?r", "<cmd>SearchBoxReplace confirm=native<cr>", desc = "Search and Replace" },
			{ "<leader>?R", "<cmd>Telescope registers<cr>", desc = "Registers" },
			{ "<leader>?k", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>?C", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>?s", "<cmd>set spell!<cr>", desc = "Spell check" },
			{ "<leader>?f", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
			{ "<leader>?g", "<cmd>Telescope git_files<cr>", desc = "Git Files" },

			-- Slime integration
			{ "<leaderw>s", "<Plug>SlimeMotionSend", desc = "Send to iPython with motion" },
			{ "<leader>sl", "<cmd>SlimeSendCurrentLine<CR>", desc = "Send Current Line" },

			-- Code
			{ "<leader>c", group = "Code" },
			-- Comment Box
			{ "<leader>cb", group = "Comment Box" },
			{ "<leader>cbl", "<cmd>CBllbox<CR>", desc = "Left aligned text" },
			{ "<leader>cbc", "<cmd>CBlcbox<CR>", desc = "Center aligned text" },
			{ "<leader>cbr", "<cmd>CBlrbox<CR>", desc = "Right aligned text" },

			-- Tools group
			{ "<leader>t", group = "Tools" },
			-- VimTeX subgroup
			{ "<leader>tx", group = "VimTeX" },
			{ "<leader>txc", "<cmd>VimtexCompile<CR>", desc = "VimTeX Compile" },
			{ "<leader>txq", "<cmd>VimtexStop<CR>", desc = "VimTeX Stop" },
			{ "<leader>txv", "<cmd>VimtexView<CR>", desc = "VimTeX View" },
			{ "<leader>txl", "<cmd>VimtexLog<CR>", desc = "VimTeX Log" },
			{ "<leader>txi", "<cmd>VimtexInfo<CR>", desc = "VimTeX Info" },
			{ "<leader>txe", "<cmd>VimtexErrors<CR>", desc = "VimTeX Errors" },
			-- Terminal
			{
				"<leader>tv",
				"<cmd>ToggleTerm direction=vertical size=55 name=vertical<CR>",
				desc = "Toggle Term Vertical",
			},
			{
				"<leader>th",
				"<cmd>ToggleTerm direction=horizontal name=horizontal<CR>",
				desc = "Toggle Term Horizontal",
			},
			{ "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle Term Center" },

			-- Quarto group
			{ "<leader>4", group = "Quarto" },
			{ "<leader>4a", "<cmd>QuartoActivate<CR>", desc = "Quarto Activate" },
			{ "<leader>4p", "<cmd>QuartoPreview<CR>", desc = "Quarto Preview" },
			{ "<leader>4c", "<cmd>QuartoClosePreview<CR>", desc = "Quarto Close Preview" },
			{ "<leader>4h", "<cmd>QuartoHelp ", desc = "Quarto Help" },
			{ "<leader>4r", "<cmd>!quarto render %<CR>", desc = "Quarto Render" },

			-- Search with motion support
			{
				"gf",
				function()
					-- Create operator function for motion-based searching
					local function grep_operator(type)
						local saved_reg = vim.fn.getreg('"')
						local saved_regtype = vim.fn.getregtype('"')

						if type == "char" then
							vim.cmd("normal! `[v`]y")
						elseif type == "line" then
							vim.cmd("normal! `[V`]y")
						elseif type == "block" then
							vim.cmd("normal! `[\022`]y") -- \022 is Ctrl-V
						else
							return
						end

						local search_term = vim.fn.getreg('"')
						vim.fn.setreg('"', saved_reg, saved_regtype)

						-- Clean up the search term
						search_term = search_term:gsub("\n", "\\n")
						search_term = vim.trim(search_term)

						if search_term ~= "" then
							require("telescope.builtin").grep_string({
								search = search_term,
								use_regex = false,
							})
						end
					end

					-- Set up the operator function
					_G.telescope_grep_operator = grep_operator
					vim.o.operatorfunc = "v:lua.telescope_grep_operator"
					return "g@"
				end,
				expr = true,
				desc = "Grep string with motion",
			},

			-- Quick access variations
			{ "<leader>gw", "<cmd>Telescope grep_string<CR>", desc = "Grep word under cursor" },
			{
				"<leader>gW",
				function()
					require("telescope.builtin").grep_string({
						search = vim.fn.expand("<cWORD>"), -- WORD includes punctuation
					})
				end,
				desc = "Grep WORD under cursor",
			},
		})

		-- Visual mode mappings
		wk.add({
			mode = { "v" },
			-- Terminal group
			{ "<leader>t", group = "Toggle Term" },
			{ "<leader>ts", group = "Toggle Term Send" },
			{ "<leader>tsl", "<cmd>ToggleTermSendVisualLines<CR>", desc = "Send Visual Lines" },
			{ "<leader>tss", "<cmd>ToggleTermSendVisualSelection<CR>", desc = "Send Visual Selection" },
			{ "<leader>tsp", "<cmd>ToggleTermSendCurrentLine<CR>", desc = "Send Line" },

			-- Search
			{ "gf", "<cmd>Telescope grep_string<CR>", desc = "Find Word Under Cursor" },

			-- Slime
			{ "<leader>s", "<Plug>SlimeRegionSend<CR>", desc = "Send to iPython" },

			-- Comment Box
			{ "<leader>c", group = "Code" },
			{ "<leader>cb", group = "Comment Box" },
			{ "<leader>cbl", "<cmd>'<,'>CBllbox<CR>", desc = "Left aligned text" },
			{ "<leader>cbc", "<cmd>'<,'>CBlcbox<CR>", desc = "Center aligned text" },
			{ "<leader>cbr", "<cmd>'<,'>CBlrbox<CR>", desc = "Right aligned text" },

			-- Obsidian
			{ "<leader>n", group = "Obsidian" },
			{ "<leader>nl", "<cmd>ObsidianLinkNew<CR>", desc = "New link" },
		})
	end,
}
