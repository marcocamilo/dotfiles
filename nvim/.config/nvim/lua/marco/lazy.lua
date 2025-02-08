local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "lazyvim.plugins" },          -- First: Core LazyVim plugins
	{ import = "lazyvim.plugins.extras" },   -- Second: Any LazyVim extras (if you have them)
	{ import = "marco.plugins" },            -- Third: Your own custom plugins
	{ import = "marco.plugins.lsp" },        -- Any additional custom plugins
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
