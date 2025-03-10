return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	-- ft = "markdown",
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		"BufReadPre /home/Camilo-Pietri.M/second-brain/*",
		"BufNewFile /home/Camilo-Pietri.M/second-brain/*",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		ui = { enable = false },
		workspaces = {
			{
				name = "marco_camilo",
				path = "~/second-brain/",
			},
		},
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
