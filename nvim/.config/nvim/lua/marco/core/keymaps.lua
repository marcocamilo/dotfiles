--  ───────────────────────────────────────────────────────────────────
--   BASE SETTING                                                      
--  ───────────────────────────────────────────────────────────────────
local keymap = vim.keymap.set
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--  ───────────────────────────────────────────────────────────────────
--   EDITING KEYS                                                      
--  ───────────────────────────────────────────────────────────────────
-- Better paste
keymap("v", "p", '"_dP', opts)

-- Better cut
keymap("n", "x", "d", opts)
keymap("n", "xx", "dd", opts)
keymap("n", "X", "D", opts)

-- Better delete
keymap("n", "d", '"_d', opts)
keymap("v", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("n", "<Del>", '"_x', opts)

-- Better change
keymap("n", "c", '"_c', opts)
keymap("n", "C", '"_C', opts)
keymap("v", "c", '"_c', opts)

-- Move lines and blocks
keymap("v", "<S-j>", ":MoveBlock(1)<CR>", opts)
keymap("v", "<S-k>", ":MoveBlock(-1)<CR>", opts)

-- Control Indentation
keymap("n", "<", "<<", { desc = "Indent left" }, opts)
keymap("n", ">", ">>", { desc = "Indent right" }, opts)
keymap("v", "<", "<gv", { desc = "Indent left" }, opts)
keymap("v", ">", ">gv", { desc = "Indent right" }, opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

--  ───────────────────────────────────────────────────────────────────
--   BUFFERS, WINDOWS AND TABS                                         
--  ───────────────────────────────────────────────────────────────────
-- Buffer Navigation
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)
keymap("n", "<S-q>", "<cmd>bd<CR>", opts) -- close buffers

-- Window Management
keymap("n", "<leader>s|", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap("n", "<leader>s-", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontallysplit split
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

--  ───────────────────────────────────────────────────────────────────
--   MISC                                                              
--  ───────────────────────────────────────────────────────────────────
keymap("n", "<leader>sw", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })

-- ─────────────────────────────────────────────────────────────────────
--   NORMAL MODE                                                       
-- ─────────────────────────────────────────────────────────────────────
-- File operations
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Write file" })
keymap("n", "<leader>W", "<cmd>wq<CR>", { desc = "Write and quit" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
keymap("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Quit (No Save)" }, opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No highlights" }, opts)

-- ─────────────────────────────────────────────────────────────────────
--   INSERT MODE                                                       
-- ─────────────────────────────────────────────────────────────────────
-- Quickly escape
keymap("i", "jk", "<ESC>", opts)

-- ─────────────────────────────────────────────────────────────────────
--   VISUAL MODE                                                       
-- ─────────────────────────────────────────────────────────────────────
-- Format Markdown Tables
keymap("v", "<leader>mt", "!pandoc -t markdown-simple_tables<CR>", { desc = "Align Mardown Table Using Pandoc" }, opts)

--  ───────────────────────────────────────────────────────────────────
--   SNIPPETS                                                          
--  ───────────────────────────────────────────────────────────────────
keymap("n", "<leader>xc", "o```<cr>```<esc>O", { desc = "Code chunk" }, opts)
keymap("n", "<leader>xp", "o```python<cr>```<esc>O", { desc = "Python code chunk" }, opts)
keymap("n", "<leader>xr", "o```r<cr>```<esc>O", { desc = "R code chunk" }, opts)
keymap("n", "<leader>xt", "o```tex<cr>```<esc>O", { desc = "TeX code chunk" }, opts)

--  ───────────────────────────────────────────────────────────────────
--   SLIME                                                             
--  ───────────────────────────────────────────────────────────────────
-- Send code with ctrl+Enter
keymap("n", "<c-cr>", "<Plug>SlimeSendCell<cr>", opts)
keymap("v", "<c-cr>", "<Plug>SlimeRegionSend<cr>", opts)
