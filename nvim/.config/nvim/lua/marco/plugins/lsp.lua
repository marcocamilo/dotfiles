return {
	-- ─────────────────────────────────────────────────────────────────────
	--   MASON: Package Manager
	-- ─────────────────────────────────────────────────────────────────────
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "rounded",
			},
		},
	},

	-- ─────────────────────────────────────────────────────────────────────
	--   MASON-TOOL-INSTALLER: Auto-install tools
	-- ─────────────────────────────────────────────────────────────────────
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				-- Formatters
				"biome",
				"clang-format",
				"isort",
				"mdformat",
				"prettier",
				"ruff",
				"stylua",
				"sqlfluff",

				-- Linters
				"eslint_d",
				"markdownlint",
			},
			run_on_start = true,
		},
	},

	-- ─────────────────────────────────────────────────────────────────────
	--   MASON-LSPCONFIG: Bridge between mason and lspconfig
	-- ─────────────────────────────────────────────────────────────────────
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- LSP Servers to auto-install
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ruff",
				"markdown_oxide",
				"harper_ls",
				"html",
				"cssls",
				"ts_ls",
				"jsonls",
				"yamlls",
				"texlab",
				"clangd",
				"terraformls",
				"bashls",
			},
			automatic_installation = true,
		},
	},

	-- ─────────────────────────────────────────────────────────────────────
	--   LSP CONFIGURATION: The core language server setup
	-- ─────────────────────────────────────────────────────────────────────
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- Enhanced capabilities with blink.cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

			-- Modern diagnostic configuration
			vim.diagnostic.config({
				virtual_text = {
					enabled = true,
					source = "if_many",
					prefix = "●",
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "if_many",
					header = "",
					prefix = "",
				},
			})

			-- Server configurations
			local servers = {

				-- Python
				pyright = {
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "workspace",
								useLibraryCodeForTypes = true,
								typeCheckingMode = "basic",
							},
						},
					},
					root_dir = require("lspconfig.util").root_pattern(
						"pyproject.toml",
						"setup.py",
						"setup.cfg",
						"requirements.txt",
						"Pipfile",
						"pyrightconfig.json",
						".venv"
					),
				},

				-- Ruff (Python linting)
				ruff = { init_options = { settings = { args = {} } } },

				-- Markdown (markdown-oxide: backlinks, wiki-links, codelens)
				markdown_oxide = {
					capabilities = vim.tbl_deep_extend(
						"force",
						vim.lsp.protocol.make_client_capabilities(),
						require("blink.cmp").get_lsp_capabilities(),
						{
							workspace = {
								didChangeWatchedFiles = {
									dynamicRegistration = true,
								},
							},
						}
					),
					filetypes = { "markdown" },
				},

				harper_ls = {
					enabled = true,
					filetypes = { "markdown", "quarto" },
					settings = {
						["harper-ls"] = {
							userDictPath = "~/.config/nvim/spell/en.utf-8.add",
							isolateEnglish = true,
							markdown = {
								IgnoreLinkTitle = true,
							},
							linters = {
								SentenceCapitalization = false,
								SpellCheck = false,
							},
						},
					},
				},

				-- LaTeX
				texlab = {
					filetypes = { "tex", "plaintex", "bib", "rmd", "quarto" },
				},
			}

			-- Setup each server
			for server, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				vim.lsp.enable(server, config)
			end
		end,
	},
}
