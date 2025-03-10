return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},

	{
		"williamboman/mason.nvim",
		lazy = false,
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"ruff",
					"mdformat",
					"eslint_d",
					"clang-format",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lsp_zero = require("lsp-zero")

			-- Global LSP settings
			lsp_zero.on_attach(function(_, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr, exclude = { "gs" } })
			end)

			lsp_zero.set_sign_icons({
				error = " ",
				warn = " ",
				info = " ",
				hint = "󰠠 ",
			})

			-- Mason & LSP setup
			require("mason-lspconfig").setup({
				ensure_installed = {
					"html",
					"cssls",
					"lua_ls",
					"marksman",
					"pyright",
					"texlab",
					"yamlls",
					"ruff",
					"clangd",
				},

				handlers = {
					lsp_zero.default_setup,

					pyright = function()
						require("lspconfig").pyright.setup({
							root_dir = require("lspconfig.util").root_pattern(
								"pyproject.toml",
								"setup.py",
								"setup.cfg",
								"requirements.txt",
								"Pipfile",
								"pyrightconfig.json",
								".venv"
							),
						})
					end,

					ruff = lsp_zero.noop, -- Disable Ruff LSP

					marksman = function()
						require("lspconfig").marksman.setup({
							filetypes = { "markdown", "quarto" },
							root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
						})
					end,

					texlab = function()
						require("lspconfig").texlab.setup({
							filetypes = { "tex", "plaintex", "bib", "rmd", "quarto" },
						})
					end,

					clangd = function()
						require("lspconfig").clangd.setup({
							filetypes = { "c", "cpp", "objc", "objcpp" },
							init_options = {
								fallbackFlags = { "-I/usr/local/include" },
							},
						})
					end,
				},
			})
		end,
	},
}
