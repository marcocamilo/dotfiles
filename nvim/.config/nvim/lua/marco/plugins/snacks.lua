return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    picker = {
      layout = {
        preset = "ivy",
        cycle = false,
      },
      formatters = {
        file = {
          filename_first = true,
          truncate = 80,
        },
      },
      matcher = {
        frecency = true,
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
          },
        },
      },
    },
    notifier = {
      enabled = false, -- you already have nvim-notify
    },
    dashboard = {
      enabled = false, -- you don't use snacks dashboard
    },
  },
}
