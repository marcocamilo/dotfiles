return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	event = "VeryLazy",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		vim.defer_fn(function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = { query = "@function.outer", desc = "Select outer function" },
							["if"] = { query = "@function.inner", desc = "Select inner function" },
							["ac"] = { query = "@class.outer", desc = "Select outer class" },
							["ic"] = { query = "@class.inner", desc = "Select inner class" },
							["aa"] = { query = "@parameter.outer", desc = "Select outer argument" },
							["ia"] = { query = "@parameter.inner", desc = "Select inner argument" },
							["al"] = { query = "@loop.outer", desc = "Select outer loop" },
							["il"] = { query = "@loop.inner", desc = "Select inner loop" },
							["ai"] = { query = "@conditional.outer", desc = "Select outer conditional" },
							["ii"] = { query = "@conditional.inner", desc = "Select inner conditional" },
							["ab"] = { query = "@block.outer", desc = "Select outer block" },
							["ib"] = { query = "@block.inner", desc = "Select inner block" },
							["ak"] = { query = "@call.outer", desc = "Select outer call" },
							["ik"] = { query = "@call.inner", desc = "Select inner call" },
							["as"] = { query = "@statement.outer", desc = "Select outer statement" },
							["is"] = { query = "@statement.inner", desc = "Select inner statement" },
							["am"] = { query = "@comment.outer", desc = "Select outer comment" },
							["im"] = { query = "@comment.inner", desc = "Select inner comment" },
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]f"] = { query = "@function.outer", desc = "Next function start" },
							["]c"] = { query = "@class.outer", desc = "Next class start" },
							["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
							["]k"] = { query = "@call.outer", desc = "Next call start" },
							["]l"] = { query = "@loop.outer", desc = "Next loop start" },
							["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
							["]s"] = { query = "@statement.outer", desc = "Next statement start" },
							["]b"] = { query = "@block.outer", desc = "Next block start" },
							["]m"] = { query = "@comment.outer", desc = "Next comment start" },
						},
						goto_next_end = {
							["]F"] = { query = "@function.outer", desc = "Next function end" },
							["]C"] = { query = "@class.outer", desc = "Next class end" },
							["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
							["]K"] = { query = "@call.outer", desc = "Next call end" },
							["]L"] = { query = "@loop.outer", desc = "Next loop end" },
							["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
							["]S"] = { query = "@statement.outer", desc = "Next statement end" },
							["]B"] = { query = "@block.outer", desc = "Next block end" },
							["]M"] = { query = "@comment.outer", desc = "Next comment end" },
						},
						goto_previous_start = {
							["[f"] = { query = "@function.outer", desc = "Previous function start" },
							["[c"] = { query = "@class.outer", desc = "Previous class start" },
							["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
							["[k"] = { query = "@call.outer", desc = "Previous call start" },
							["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
							["[i"] = { query = "@conditional.outer", desc = "Previous conditional start" },
							["[s"] = { query = "@statement.outer", desc = "Previous statement start" },
							["[b"] = { query = "@block.outer", desc = "Previous block start" },
							["[m"] = { query = "@comment.outer", desc = "Previous comment start" },
						},
						goto_previous_end = {
							["[F"] = { query = "@function.outer", desc = "Previous function end" },
							["[C"] = { query = "@class.outer", desc = "Previous class end" },
							["[A"] = { query = "@parameter.inner", desc = "Previous argument end" },
							["[K"] = { query = "@call.outer", desc = "Previous call end" },
							["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
							["[I"] = { query = "@conditional.outer", desc = "Previous conditional end" },
							["[S"] = { query = "@statement.outer", desc = "Previous statement end" },
							["[B"] = { query = "@block.outer", desc = "Previous block end" },
							["[M"] = { query = "@comment.outer", desc = "Previous comment end" },
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>sn"] = { query = "@parameter.inner", desc = "Swap next parameter" },
						},
						swap_previous = {
							["<leader>sp"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
						},
					},
				},
			})
		end, 0)
	end,
}
