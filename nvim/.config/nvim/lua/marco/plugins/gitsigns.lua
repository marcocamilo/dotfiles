return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		-- Beautiful sign configuration
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},

		-- Enhanced sign highlighting
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},

		-- Performance optimizations
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

		-- Refresh and update settings
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = false, -- Performance: don't attach to untracked files

		-- Enhanced current line blame
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 300,
			ignore_whitespace = false,
			virt_text_priority = 100,
		},
		current_line_blame_formatter = " <author>, <author_time:%R> • <summary>",

		-- Status integration
		sign_priority = 6,
		update_debounce = 100, -- Performance: debounce updates
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Performance: disable for very large files

		-- Enhanced preview configuration
		preview_config = {
			-- Options passed to nvim_open_win
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},

		-- Advanced diff configuration
		diff_opts = {
			algorithm = "patience", -- myers, minimal, patience, histogram
			internal = false, -- Use external diff
			indent_heuristic = true,
			vertical = true,
		},

		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

    -- stylua: ignore start
    map("n", "]h", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gs.nav_hunk("next")
      end
    end, "Next Hunk")
    map("n", "[h", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gs.nav_hunk("prev")
      end
    end, "Prev Hunk")
		end,
	},
	config = function(_, opts)
		require("gitsigns").setup(opts)

		-- Custom highlights for better visual appeal
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				-- Enhanced sign colors
				vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#3fb950", bg = "NONE" })
				vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#d29922", bg = "NONE" })
				vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#f85149", bg = "NONE" })
				vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#656d76", bg = "NONE" })

				-- Staged signs
				vim.api.nvim_set_hl(0, "GitSignsStagedAdd", { fg = "#26a148", bg = "NONE" })
				vim.api.nvim_set_hl(0, "GitSignsStagedChange", { fg = "#b58407", bg = "NONE" })
				vim.api.nvim_set_hl(0, "GitSignsStagedDelete", { fg = "#da3633", bg = "NONE" })

				-- Current line blame
				vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
					fg = "#7d8590",
					bg = "NONE",
					italic = true,
				})
			end,
		})

		-- Trigger initial highlighting
		vim.cmd("doautocmd ColorScheme")
	end,
}
