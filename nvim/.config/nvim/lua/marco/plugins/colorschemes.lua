local colors = require("marco.colors")

return {
	{
		"eldritch-theme/eldritch.nvim",
		name = "eldritch",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			on_colors = function(global_colors)
				local color_definitions = {
					-- Background
					bg = colors.bg,
					bg_dark = colors.bg_dark,
					bg_highlight = colors.bg_highlight,
					bg_visual = colors.bg_visual,
					bg_statusline = colors.bg_statusline,

					-- Foreground
					fg = colors.fg,
					fg_dark = colors.fg_dark,
					fg_gutter = colors.fg_gutter,
					comment = colors.comment,

					-- Core palette
					red = colors.red,
					orange = colors.orange,
					yellow = colors.yellow,
					green = colors.green,
					cyan = colors.cyan,
					blue = colors.blue,
					purple = colors.purple,
					magenta = colors.magenta,
					pink = colors.pink,

					-- Bright variants
					bright_red = colors.red,
					bright_green = colors.green,
					bright_yellow = colors.yellow,
					bright_blue = colors.purple,
					bright_magenta = colors.magenta,
					bright_cyan = colors.cyan,
					bright_white = colors.fg,

					-- UI elements
					border = colors.ui_border,
					menu = colors.ui_menu,
					visual = colors.bg_visual,
					selection = colors.bg_visual,
					gutter_fg = colors.fg_gutter,
					nontext = colors.ui_nontext,
					white = colors.fg,
					black = colors.bg,
					terminal_black = colors.bg_deep,
					dark3 = colors.bg_deep,
					dark5 = colors.bg_deep,
					dark_cyan = colors.cyan,
					dark_green = colors.green,
					dark_yellow = colors.yellow,

					-- Git
					git = {
						change = colors.git_change,
						add = colors.git_add,
						delete = colors.git_delete,
					},
					gitSigns = {
						change = colors.git_change,
						add = colors.git_add,
						delete = colors.git_delete,
					},
				}

				for key, value in pairs(color_definitions) do
					global_colors[key] = value
				end
			end,

			on_highlights = function(hl)
				local highlight_definitions = {
					-- Cursor line
					CursorLine = { bg = colors.bg_deep },

					-- Visual selection
					Visual = { bg = colors.bg_visual, fg = colors.bg },

					-- Markdown
					["@markup.strong"] = { fg = colors.green, bold = true },
					["@markup.raw.markdown_inline"] = { fg = colors.magenta },
					["@markup.heading.1.markdown"] = { fg = colors.green, bg = colors.head1_bg, bold = true },
					["@markup.heading.2.markdown"] = { fg = colors.cyan, bg = colors.head2_bg, bold = true },
					["@markup.heading.3.markdown"] = { fg = colors.blue, bg = colors.head3_bg, bold = true },
					["@markup.heading.4.markdown"] = { fg = colors.purple, bg = colors.head4_bg, bold = true },
					["@markup.heading.5.markdown"] = { fg = colors.purple_light, bg = colors.head5_bg, bold = true },
					["@markup.heading.6.markdown"] = { fg = colors.burgundy, bg = colors.head6_bg, bold = true },

					-- Spell
					SpellBad = { sp = colors.red, undercurl = true, bold = true, italic = true },
					SpellCap = { sp = colors.yellow_light, undercurl = true, bold = true, italic = true },

					-- Colorcolumn
					ColorColumn = { bg = colors.bg_deep },

					-- Folded lines
					Folded = { bg = "NONE" },

					-- Floats and borders
					FloatBorder = { fg = colors.green, bg = colors.bg },
					NormalFloat = { bg = colors.bg_dark },

					-- Noice cmdline
					NoiceCmdlineIconCmdline = { fg = colors.cyan },
					NoiceCmdlinePopupBorderCmdline = { fg = colors.green },

					-- Winbar (for later use)
					WinBar1 = { fg = colors.cyan },
					WinBar2 = { fg = colors.green },
					WinBar3 = { fg = colors.magenta_light, bold = true },

					-- Markdown heading backgrounds (for render-markdown.nvim)
					Headline1Bg = { fg = colors.green, bg = colors.head1_bg },
					Headline2Bg = { fg = colors.cyan, bg = colors.head2_bg },
					Headline3Bg = { fg = colors.blue, bg = colors.head3_bg },
					Headline4Bg = { fg = colors.purple, bg = colors.head4_bg },
					Headline5Bg = { fg = colors.purple_light, bg = colors.head5_bg },
					Headline6Bg = { fg = colors.burgundy, bg = colors.head6_bg },

					Headline1Fg = { fg = colors.green, bold = true },
					Headline2Fg = { fg = colors.cyan, bold = true },
					Headline3Fg = { fg = colors.blue, bold = true },
					Headline4Fg = { fg = colors.purple, bold = true },
					Headline5Fg = { fg = colors.purple_light, bold = true },
					Headline6Fg = { fg = colors.burgundy, bold = true },

					-- Codeblocks for render-markdown
					RenderMarkdownCode = { bg = colors.bg_deep },
					RenderMarkdownCodeInline = { fg = colors.green, bg = colors.bg_deep },

          -- Callout / blockquote colors for render-markdown
          RenderMarkdownQuote = { fg = colors.blue, bg = colors.blue_dark, bold = true },
          RenderMarkdownInfo = { fg = colors.blue, bg = colors.blue_dark, bold = true },
          RenderMarkdownWarn = { fg = colors.orange, bg = colors.orange_dark, bold = true },
          RenderMarkdownError = { fg = colors.red, bg = colors.red_dark, bold = true },
          RenderMarkdownHint = { fg = colors.orange, bg = colors.orange_dark, bold = true },
          RenderMarkdownSuccess = { fg = colors.green, bg = colors.green_dark, bold = true },
				}

				for group, props in pairs(highlight_definitions) do
					hl[group] = props
				end
			end,
		},
		config = function(_, opts)
			require("eldritch").setup(opts)
			vim.cmd.colorscheme("eldritch")
		end,
	},
}
