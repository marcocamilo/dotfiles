return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      cpp = { "clang-format" },
      html = { "prettier" },
      javascript = { "prettier" },
      json = { "biome" },
      jsonc = { "biome" },
      lua = { "stylua" },
      markdown = { "mdformat" },
      python = { "ruff_fix", "ruff_format", "isort" },
      sql = { "sqruff" },
      yaml = { "prettier" },
    },
  },
  keys = {
    {
      "<leader>mp",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Make pretty with formatter",
    },
  },
}
