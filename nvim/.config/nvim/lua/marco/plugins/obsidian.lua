return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = false,
	-- ft = "markdown",
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		"BufReadPre /home/marcocamilo/mac-brain/*",
		"BufNewFile /home/marcocamilo/mac-brain/*",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- config = function ()
	--   if vim.fn.getcwd() == vim.fn.expand "~" .. "/mac-brain" then
	--     require("lazy").load({ plugins = { "obsidian.nvim" } })
	--   end
	-- end,
	opts = {
		ui = { enable = false },
		workspaces = {
			{
				name = "mac-brain",
				path = "~/mac-brain/",
			},
		},
		completion = {
			blink = true,
		},
		wiki_link_func = function(opts)
			---@type string
			local header_or_block = ""
			if opts.anchor then
				header_or_block = opts.anchor.anchor
			elseif opts.block then
				header_or_block = string.format("#%s", opts.block.id)
			end

			-- Get just the filename by finding text after the last slash
			local filename = opts.path:match("([^/]+)$") or opts.path

			-- Remove extension if present
			filename = filename:match("(.+)%..+$") or filename

			return string.format("[[%s%s]]", filename, header_or_block)
		end,
		notes_subdir = "1. Knowledge",
		new_notes_location = "notes_subdir",
		daily_notes = {
			folder = "daily/",
		},
		disable_frontmatter = true,
		note_id_func = function(title)
			if title ~= nil then
				title = title
			else
				title = tostring(os.time()) .. "-new_note"
			end
			return title
		end,
	},
}
