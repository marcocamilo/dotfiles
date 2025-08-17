return {
	"karb94/neoscroll.nvim",
	keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" }, -- Only load when scrolling
	opts = {
		-- Key mappings for smooth scrolling
		mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },

		-- Performance optimizations
		hide_cursor = true, -- Hide cursor while scrolling (smoother)
		stop_eof = true, -- Stop at end of file
		respect_scrolloff = true, -- Respect scrolloff settings
		cursor_scrolls_alone = true, -- Cursor independent scrolling

		-- Smooth animation settings
		easing_function = "quadratic", -- Smooth easing (nil, "linear", "quadratic", "cubic", "quartic", "quintic", "circular", "sine")

		-- Performance tuning
		performance_mode = false, -- Set to true if you experience lag on large files

		-- Custom scroll speeds (milliseconds)
		-- Faster = more responsive, slower = smoother
		duration_multiplier = 1.0, -- Global speed multiplier

		-- Disable on certain filetypes for performance
		disabled_filetypes = { "prompt", "TelescopePrompt", "alpha", "dashboard" },
	},
}
