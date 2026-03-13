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
          bg = "#000000",
          bg_dark = "#0a0a12",
          bg_highlight = "#1a1b2e",
          bg_visual = "#e9b3fd",
          bg_statusline = "#0a0a12",

          -- Foreground
          fg = "#ffffff",
          fg_dark = "#ffffff",
          fg_gutter = "#232e3b",
          comment = "#b7bfce",

          -- Core palette
          green = "#37f499",
          cyan = "#04d1f9",
          purple = "#987afb",
          pink = "#fca6ff",
          yellow = "#9ad900",
          red = "#f16c75",
          orange = "#e58f2a",

          -- Bright variants
          bright_red = "#f16c75",
          bright_green = "#37f499",
          bright_yellow = "#9ad900",
          bright_blue = "#987afb",
          bright_magenta = "#fca6ff",
          bright_cyan = "#04d1f9",
          bright_white = "#ffffff",

          -- UI elements
          border = "#04d1f9",
          menu = "#000000",
          visual = "#e9b3fd",
          selection = "#e9b3fd",
          gutter_fg = "#232e3b",
          nontext = "#232e3b",
          white = "#ffffff",
          black = "#000000",
          terminal_black = "#141b22",
          dark3 = "#141b22",
          dark5 = "#141b22",
          dark_cyan = "#04d1f9",
          dark_green = "#37f499",
          dark_yellow = "#9ad900",
          magenta = "#fca6ff",
          magenta2 = "#fca6ff",
          magenta3 = "#fca6ff",

          -- Git
          git = {
            change = "#04d1f9",
            add = "#37f499",
            delete = "#f16c75",
          },
          gitSigns = {
            change = "#04d1f9",
            add = "#37f499",
            delete = "#f16c75",
          },
        }

        for key, value in pairs(color_definitions) do
          global_colors[key] = value
        end
      end,

      on_highlights = function(hl)
        local highlight_definitions = {
          -- Cursor line
          CursorLine = { bg = "#141b22" },

          -- Visual selection
          Visual = { bg = "#e9b3fd", fg = "#000000" },

          -- Markdown
          ["@markup.strong"] = { fg = "#f94dff", bold = true },
          ["@markup.raw.markdown_inline"] = { fg = "#fca6ff" },

          -- Spell
          SpellBad = { sp = "#f16c75", undercurl = true, bold = true, italic = true },
          SpellCap = { sp = "#f1fc79", undercurl = true, bold = true, italic = true },

          -- Colorcolumn
          ColorColumn = { bg = "#141b22" },

          -- Folded lines
          Folded = { bg = "NONE" },

          -- Floats and borders
          FloatBorder = { fg = "#37f499", bg = "#000000" },
          NormalFloat = { bg = "#0a0a12" },

          -- Noice cmdline
          NoiceCmdlineIconCmdline = { fg = "#04d1f9" },
          NoiceCmdlinePopupBorderCmdline = { fg = "#37f499" },

          -- Winbar (for later use)
          WinBar1 = { fg = "#04d1f9" },
          WinBar2 = { fg = "#37f499" },
          WinBar3 = { fg = "#f94dff", bold = true },
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
