return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
        cpp = { "clang-format" },
				javascript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "biome" },
				jsonc = { "biome" },
				lua = { "stylua" },
				markdown = { "mdformat" },
				python = { "ruff_fix", "ruff_format", "isort" },
				yaml = { "prettier" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 5000,
			})
		end, { desc = "Make pretty with formatter" })
	end,
}
