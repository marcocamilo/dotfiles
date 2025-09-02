return {
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"LudoPinelli/comment-box.nvim",
		opts = {
			doc_width = 80,
			box_width = 70,
			borders = {
				top = "─",
				bottom = "─",
				left = " ",
				right = " ",
				top_left = "─",
				top_right = "─",
				bottom_left = "─",
				bottom_right = "─",
			},
			line_width = 70,
			line = {
				line = "─",
				line_start = "─",
				line_end = "─",
			},
			outer_blank_lines = false,
			inner_blank_lines = false,
			line_blank_line_above = false,
			line_blank_line_below = false,
		},
	},
}
