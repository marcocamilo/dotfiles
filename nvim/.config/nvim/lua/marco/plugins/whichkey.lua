return {
	"folke/which-key.nvim",
	opts = {
		-- Modern which-key v3 configuration
		preset = "classic",
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
	},
	-- Modern spec-based configuration
	init = function()
		local wk = require("which-key")

		-- Normal mode mappings with <leader>
		wk.add({
			-- File operations
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
			{ "<leader>f", function() Snacks.picker.files() end, desc = "Find files", },
			{ "<leader>F", function() Snacks.picker.grep() end, desc = "Find Text", },
			{ "<leader>b",
				function()
					Snacks.picker.buffers({
						on_show = function()
							vim.cmd.stopinsert()
						end,
						sort_lastused = true,
					})
				end,
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
			{ "<leader>nn", "<cmd>Obsidian new<CR>", desc = "Create New Note" },
			{ "<leader>nb", "<cmd>Obsidian backlinks<CR>", desc = "Note Backlinks" },
			{ "<leader>ns", "<cmd>Obsidian search<CR>", desc = "Note Search" },
			{ "<leader>nr", "<cmd>Obsidian rename<CR>", desc = "Rename Note Link" },

      -- LSP Navigation (g-prefix, fast access)
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Go to Definition" },
      { "gr", function() Snacks.picker.lsp_references() end, desc = "Go to References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Go to Implementation" },
      { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Go to Type Definition" },
      { "gD", function() vim.lsp.buf.declaration() end, desc = "Go to Declaration" },
      { "K", function() vim.lsp.buf.hover() end, desc = "Hover Documentation" },
      { "gK", function() vim.lsp.buf.signature_help() end, desc = "Signature Help" },

      -- LSP Actions (leader-prefix, less frequent)
      { "<leader>l", group = "LSP" },
      { "<leader>la", function() vim.lsp.buf.code_action() end, desc = "Code Action" },
      { "<leader>ld", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
      { "<leader>lD", function() vim.diagnostic.open_float() end, desc = "Line Diagnostics" },
      { "<leader>lw", function() Snacks.picker.diagnostics() end, desc = "Workspace Diagnostics" },
      { "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format Buffer" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
      { "<leader>ll", function() vim.lsp.codelens.run() end, desc = "CodeLens Action" },
      { "<leader>ln", function() vim.lsp.buf.rename() end, desc = "Rename Symbol" },
      { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "Document Symbols" },
      { "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace Symbols" },
      { "<leader>lR", "<cmd>LspRestart<CR>", desc = "Restart LSP" },
      { "<leader>lx", "<cmd>LspStop<cr>", desc = "LSP Stop" },
      { "<leader>lo", "<cmd>LspStart<cr>", desc = "LSP Start" },

			-- Messages
			{ "<leader>;", group = "Messages" },
			{ "<leader>;h", function() Snacks.picker.notifications() end, desc = "Notifications", },
			{ "<leader>;a", "<cmd>Noice all<cr>", desc = "All messages" },
			{ "<leader>;e", "<cmd>Noice errors<cr>", desc = "Errors only" },
			{ "<leader>;d", "<cmd>Noice dismiss<cr>", desc = "Dismiss all" },

			-- UI Toggles
			{ "<leader>u", group = "UI" },
			{ "<leader>ut",
				function()
					require("treesitter-context").toggle()
					local enabled = require("treesitter-context.config").enabled
					vim.notify((enabled and "Enabled" or "Disabled") .. " Treesitter Context", vim.log.levels.INFO)
				end,
				desc = "Toggle Treesitter Context",
			},

			-- Search group
			{ "<leader>?", group = "Search" },
			{ "<leader>?c", function() Snacks.picker.colorschemes() end, desc = "Colorscheme", },
			{ "<leader>?h", function() Snacks.picker.help() end, desc = "Find Help", },
			{ "<leader>?R", function() Snacks.picker.registers() end, desc = "Registers", },
			{ "<leader>?k", function() Snacks.picker.keymaps() end, desc = "Keymaps", },
			{ "<leader>?C", function() Snacks.picker.commands() end, desc = "Commands", },
			{ "<leader>?s", "<cmd>set spell!<cr>", desc = "Spell check" },
			{ "<leader>?f", function() Snacks.picker.recent() end, desc = "Recent Files", },
			{ "<leader>?g", function() Snacks.picker.git_files() end, desc = "Git Files", },

			-- Search and Replace (grug-far)
			{ "<leader>?r", group = "Replace" },
			{ "<leader>?rp",
				function()
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					require("grug-far").open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				desc = "Replace (project)",
			},
			{
				"<leader>?rf",
				function()
					require("grug-far").open({
						prefills = { paths = vim.fn.expand("%") },
					})
				end,
				desc = "Replace (current file)",
			},

			-- Git
			{ "<leader>g", group = "Git" },
			-- Git hunks (staging, reset, preview)
			{ "<leader>gh", group = "Git Hunks" },
			{ "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk", mode = { "n", "v" } },
			{ "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk", mode = { "n", "v" } },
			{ "<leader>ghS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage buffer" },
			{ "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo stage hunk" },
			{ "<leader>ghR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset buffer" },
			{ "<leader>ghp", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview hunk inline" },
			{ "<leader>ghP", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
			-- Git blame
			{ "<leader>gb", group = "Git Blame" },
			{ "<leader>gbb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Blame line", },
			{ "<leader>gbB", function() require("gitsigns").blame() end, desc = "Blame buffer", },
			{ "<leader>gbt", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle line blame" },
			-- Git diff
			{ "<leader>gd", group = "Git Diff" },
			{ "<leader>gdd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff this" },
			{ "<leader>gdD", function() require("gitsigns").diffthis("~") end, desc = "Diff this ~", },
			{ "<leader>gdt", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Toggle deleted" },
			-- Git toggles
			{ "<leader>gt", group = "Git Toggles" },
			{ "<leader>gts", "<cmd>Gitsigns toggle_signs<cr>", desc = "Toggle signs" },
			{ "<leader>gtn", "<cmd>Gitsigns toggle_numhl<cr>", desc = "Toggle number highlight" },
			{ "<leader>gtl", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Toggle line highlight" },
			{ "<leader>gtw", "<cmd>Gitsigns toggle_word_diff<cr>", desc = "Toggle word diff" },

			-- Slime integration
			{ "<leader>s", "<Plug>SlimeMotionSend", desc = "Send to iPython with motion" },
			{ "<leader>sgg", "ggV''<Plug>SlimeRegionSend<CR><cmd-O><cmd-O>", desc = "Send to iPython with motion" },
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
					_G.snacks_grep_operator = function(type)
						local saved_reg = vim.fn.getreg('"')
						local saved_regtype = vim.fn.getregtype('"')

						if type == "char" then
							vim.cmd("normal! `[v`]y")
						elseif type == "line" then
							vim.cmd("normal! `[V`]y")
						elseif type == "block" then
							vim.cmd("normal! `[\022`]y")
						else
							return
						end

						local search_term = vim.fn.getreg('"')
						vim.fn.setreg('"', saved_reg, saved_regtype)
						search_term = search_term:gsub("\n", "\\n")
						search_term = vim.trim(search_term)

						if search_term ~= "" then
							Snacks.picker.grep({ search = search_term })
						end
					end

					vim.o.operatorfunc = "v:lua.snacks_grep_operator"
					return "g@"
				end,
				expr = true,
				desc = "Grep string with motion",
			},

			-- Quick access variations
			{ "<leader>gw", function() Snacks.picker.grep_word() end, desc = "Grep word under cursor", },
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
			{ "gf", function() Snacks.picker.grep_word() end, desc = "Grep selection", },
			-- Search and Replace (grug-far)
			{
				"<leader>r",
				function()
					require("grug-far").with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
				end,
				desc = "Replace (selection)",
			},

			-- Slime
			{ "<leader>s", "<Plug>SlimeRegionSend<CR>", desc = "Send to iPython" },

			-- Comment Box
			{ "<leader>c", group = "Code" },
			{ "<leader>cb", group = "Comment Box" },
			{ "<leader>cbl", "<cmd>'<,'>CBllbox<CR>", desc = "Left aligned text" },
			{ "<leader>cbc", "<cmd>'<,'>CBlcbox<CR>", desc = "Center aligned text" },
			{ "<leader>cbr", "<cmd>'<,'>CBlrbox<CR>", desc = "Right aligned text" },
		})
	end,
}
