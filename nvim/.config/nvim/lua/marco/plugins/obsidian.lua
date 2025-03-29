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
