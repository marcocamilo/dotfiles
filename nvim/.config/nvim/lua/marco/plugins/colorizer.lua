return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		filetypes = {
      "cfg",
			"css",
			"html",
			"lua",
			"python",
      "cpp",
      "dosini",
		},
	},
}
