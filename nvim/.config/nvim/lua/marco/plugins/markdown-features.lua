-- ─────────────────────────────────────────────────────────────────────
--   Task Management
-- ─────────────────────────────────────────────────────────────────────
local function toggle_task()
	local line = vim.api.nvim_get_current_line()
	local timestamp = os.date("%Y-%m-%d %H:%M")

	-- Not a task line
	if not line:match("^%s*%- %[[x ]%]") then
		vim.notify("Not a task item", vim.log.levels.INFO)
		return
	end

	-- Unchecked → mark done
	if line:match("^%s*%- %[ %]") then
		local new_line = line:gsub("^(%s*%- )%[ %](.*)", "%1[x] `done: " .. timestamp .. "`%2")
		vim.api.nvim_set_current_line(new_line)
		vim.notify("Completed", vim.log.levels.INFO)
		return
	end

	-- Checked with done label → uncheck and remove label
	if line:match("^%s*%- %[x%].*`done:.-`") then
		local new_line = line:gsub("^(%s*%- )%[x%]%s*`done:.-`(.*)", "%1[ ]%2")
		vim.api.nvim_set_current_line(new_line)
		vim.notify("Untoggled", vim.log.levels.INFO)
		return
	end

	-- Checked without done label → just uncheck
	if line:match("^%s*%- %[x%]") then
		local new_line = line:gsub("^(%s*%- )%[x%]", "%1[ ]")
		vim.api.nvim_set_current_line(new_line)
		vim.notify("Untoggled", vim.log.levels.INFO)
		return
	end
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "quarto" },
	callback = function(args)
		vim.keymap.set("n", "<CR>", function()
			local line = vim.api.nvim_get_current_line()

			-- Already a task → toggle it
			if line:match("^%s*%- %[[x ]%]") then
				MarkdownFeatures.toggle_task()
				return
			end

			-- A bullet but not a task → convert to task
			if line:match("^%s*%- ") then
				local new_line = line:gsub("^(%s*%- )(.*)", "%1[ ] %2")
				vim.api.nvim_set_current_line(new_line)
				return
			end

			-- Not a bullet at all → make it a task from scratch
			if line:match("^%s*$") then
				vim.api.nvim_set_current_line("- [ ] ")
				vim.cmd("startinsert!")
				return
			end

			-- Has text but no bullet → prepend task bullet
			local new_line = line:gsub("^(%s*)(.*)", "%1- [ ] %2")
			vim.api.nvim_set_current_line(new_line)
		end, { buffer = args.buf, desc = "Toggle/create task checkbox" })
	end,
})

-- ─────────────────────────────────────────────────────────────────────
--   Expose globally for which-key
-- ─────────────────────────────────────────────────────────────────────
MarkdownFeatures = {
	toggle_task = toggle_task,
}

return {}
