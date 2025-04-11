return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = { query = "@call.outer", desc = "Next method call start" },
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
            ["]b"] = { query = "@codechunk.outer", desc = "Next code chunk start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
            ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
          },
          goto_previous_start = {
            ["[m"] = { query = "@call.outer", desc = "Prev method call start" },
            ["[f"] = { query = "@function.outer", desc = "Prev function start" },
            ["[b"] = { query = "@codechunk.outer", desc = "Prev code chunk start" },
            ["[c"] = { query = "@class.outer", desc = "Prev class start" },
            ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
            ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
          },
          goto_next_end = {
            ["]M"] = { query = "@call.outer", desc = "Next method call end" },
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]B"] = { query = "@codechunk.outer", desc = "Next code chunk end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
            ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
            ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
          },
          goto_previous_end = {
            ["[M"] = { query = "@call.outer", desc = "Prev method call end" },
            ["[F"] = { query = "@function.outer", desc = "Prev function end" },
            ["[B"] = { query = "@codechunk.outer", desc = "Prev code chunk end" },
            ["[C"] = { query = "@class.outer", desc = "Prev class end" },
            ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
            ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
          },
        },
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ab"] = "@codechunk.outer",
            ["ib"] = "@codechunk.inner",
          },
        },
      },
    })
  end
}
