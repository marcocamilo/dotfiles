return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	dependencies = "nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	config = function()
		-- Setup module options
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
				selection_modes = {
					["@parameter.outer"] = "v",
					["@function.outer"] = "V",
					["@class.outer"] = "<c-v>",
				},
				include_surrounding_whitespace = false,
			},
			move = {
				set_jumps = true,
			},
		})

		-- SELECT (visual + operator-pending)
		local select_maps = {
			{ "af", "@function.outer", "Select outer function" },
			{ "if", "@function.inner", "Select inner function" },
			{ "ac", "@class.outer", "Select outer class" },
			{ "ic", "@class.inner", "Select inner class" },
			{ "aa", "@parameter.outer", "Select outer argument" },
			{ "ia", "@parameter.inner", "Select inner argument" },
			{ "al", "@loop.outer", "Select outer loop" },
			{ "il", "@loop.inner", "Select inner loop" },
			{ "ai", "@conditional.outer", "Select outer conditional" },
			{ "ii", "@conditional.inner", "Select inner conditional" },
			{ "ab", "@block.outer", "Select outer block" },
			{ "ib", "@block.inner", "Select inner block" },
			{ "ak", "@call.outer", "Select outer call" },
			{ "ik", "@call.inner", "Select inner call" },
			{ "as", "@statement.outer", "Select outer statement" },
			{ "is", "@statement.inner", "Select inner statement" },
			{ "am", "@comment.outer", "Select outer comment" },
			{ "im", "@comment.inner", "Select inner comment" },
		}

		local select_mod = require("nvim-treesitter-textobjects.select")
		for _, map in ipairs(select_maps) do
			vim.keymap.set({ "x", "o" }, map[1], function()
				select_mod.select_textobject(map[2], "textobjects")
			end, { desc = map[3] })
		end

		-- MOVE (normal + visual + operator-pending)
		local move_mod = require("nvim-treesitter-textobjects.move")

		local move_maps = {
			{
				"f",
				"@function.outer",
				"Next function start",
				"Next function end",
				"Previous function start",
				"Previous function end",
			},
			{ "c", "@class.outer", "Next class start", "Next class end", "Previous class start", "Previous class end" },
			{
				"a",
				"@parameter.inner",
				"Next argument start",
				"Next argument end",
				"Previous argument start",
				"Previous argument end",
			},
			{ "k", "@call.outer", "Next call start", "Next call end", "Previous call start", "Previous call end" },
			{ "l", "@loop.outer", "Next loop start", "Next loop end", "Previous loop start", "Previous loop end" },
			{
				"i",
				"@conditional.outer",
				"Next conditional start",
				"Next conditional end",
				"Previous conditional start",
				"Previous conditional end",
			},
			{
				"s",
				"@statement.outer",
				"Next statement start",
				"Next statement end",
				"Previous statement start",
				"Previous statement end",
			},
			{ "b", "@block.outer", "Next block start", "Next block end", "Previous block start", "Previous block end" },
			{
				"m",
				"@comment.outer",
				"Next comment start",
				"Next comment end",
				"Previous comment start",
				"Previous comment end",
			},
		}

		for _, map in ipairs(move_maps) do
			local key, query = map[1], map[2]

			vim.keymap.set({ "n", "x", "o" }, "]" .. key, function()
				move_mod.goto_next_start(query, "textobjects")
			end, { desc = map[3] })

			vim.keymap.set({ "n", "x", "o" }, "]" .. key:upper(), function()
				move_mod.goto_next_end(query, "textobjects")
			end, { desc = map[4] })

			vim.keymap.set({ "n", "x", "o" }, "[" .. key, function()
				move_mod.goto_previous_start(query, "textobjects")
			end, { desc = map[5] })

			vim.keymap.set({ "n", "x", "o" }, "[" .. key:upper(), function()
				move_mod.goto_previous_end(query, "textobjects")
			end, { desc = map[6] })
		end

		-- SWAP
		local swap_mod = require("nvim-treesitter-textobjects.swap")

		vim.keymap.set("n", "<leader>sn", function()
			swap_mod.swap_next("@parameter.inner")
		end, { desc = "Swap next parameter" })

		vim.keymap.set("n", "<leader>sp", function()
			swap_mod.swap_previous("@parameter.inner")
		end, { desc = "Swap previous parameter" })

		----------------------------------------------------------------------
		-- REPEATABLE MOVES (optional — uncomment if you want ; and , support)
		----------------------------------------------------------------------
		-- local ts_repeat = require("nvim-treesitter-textobjects.repeatable_move")
		-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat.repeat_last_move_next)
		-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat.repeat_last_move_previous)
		-- vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat.builtin_f_expr, { expr = true })
		-- vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat.builtin_F_expr, { expr = true })
		-- vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat.builtin_t_expr, { expr = true })
		-- vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat.builtin_T_expr, { expr = true })
	end,
}
