return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = "hrsh7th/nvim-cmp",
	config = function()
		-- Setup autopairs with essential configurations
		require("nvim-autopairs").setup({
			check_ts = true,
			disable_filetype = { "TelescopePrompt" },
			ts_config = {
				lua = { "string", "source" },
				javascript = { "string", "template_string" },
			},
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%)%>%]%)%}%,]]=],
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "PmenuSel",
				highlight_grey = "LineNr",
			},
		})

		-- Rules
		local Rule = require("nvim-autopairs.rule")
		local npairs = require("nvim-autopairs")

		npairs.add_rules({
			Rule("*", "*", "markdown")
				:with_pair(function(opts)
					-- Only pair when not followed by another *
					local next_char = opts.line:sub(opts.col + 1, opts.col + 1)
					return next_char ~= "*"
				end)
				:with_move(function(opts)
					return opts.prev_char:match(".%*") ~= nil
				end)
				:use_key("*"),
		})

		-- Integrate with nvim-cmp for autocompletion
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		require("cmp").event:on(
			"confirm_done",
			cmp_autopairs.on_confirm_done({
				filetypes = {
					["*"] = {
						["("] = {
							kind = {
								require("cmp").lsp.CompletionItemKind.Function,
								require("cmp").lsp.CompletionItemKind.Method,
							},
						},
					},
					lua = {
						["("] = {
							kind = {
								require("cmp").lsp.CompletionItemKind.Function,
								require("cmp").lsp.CompletionItemKind.Method,
							},
							handler = function(char, item, bufnr, rules, commit_character) end,
						},
					},
					rmd = {
						["{"] = {
							kind = {
								require("cmp").lsp.CompletionItemKind.Function,
								require("cmp").lsp.CompletionItemKind.Method,
							},
						},
					},
					tex = false, -- Disable autopairs for tex
			},
		}))

		-- LaTeX-specific autopairs rules
		require("nvim-autopairs").add_rules({
			require("nvim-autopairs.rule")("$", "$", "tex"),
			require("nvim-autopairs.rule")("\\[", "\\]", "tex"),
		})
	end,
}
