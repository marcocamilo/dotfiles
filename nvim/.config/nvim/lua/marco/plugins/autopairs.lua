return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")

		npairs.setup({
			check_ts = true, -- Use treesitter for better pair detection
			ts_config = {
				lua = { "string", "source" },
				javascript = { "string", "template_string" },
				python = { "string", "f_string" },
			},
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%)%>%]%)%}%,]]=],
				offset = 0,
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "PmenuSel",
				highlight_grey = "LineNr",
			},
		})

		-- Custom rules for specific filetypes
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		-- Markdown rules
		npairs.add_rules({
			Rule("*", "*", "markdown"):with_pair(cond.not_after_regex("*", 1)):with_move(function(opts)
				return opts.prev_char:match(".%*") ~= nil
			end),
		})

		-- LaTeX rules
		npairs.add_rules({
			Rule("$", "$", "tex"):with_pair(cond.not_filetypes({ "vim" })),
			Rule("\\[", "\\]", "tex"),
		})
	end,
}
