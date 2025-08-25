local opt = vim.opt

-- ⚡ PERFORMANCE OPTIMIZATIONS
opt.ttyfast = true        -- Fast terminal connection
opt.updatetime = 250      -- Faster CursorHold events
opt.timeoutlen = 500      -- Key sequence timeout
opt.redrawtime = 5000     -- Syntax highlighting timeout
opt.maxmempattern = 5000  -- Pattern matching memory limit    
opt.synmaxcol = 240       -- Syntax highlighting column limit 
opt.history = 1000        -- Command history size             

-- 📱 USER INTERFACE LAYOUT
opt.showtabline = 0       -- When to show tab pages: 0=never, 1=multiple, 2=always
opt.laststatus = 3        -- When to show status line: 3=global for all windows
opt.cmdheight = 1         -- Screen lines for command-line area
opt.showcmd = false       -- Show partial command in last line
opt.showmode = false      -- Show current mode in command line
opt.ruler = false         -- Show cursor line/column in status

-- 📊 LINE NUMBERS & POSITIONING
opt.number = true         -- Show line numbers in left margin
opt.relativenumber = true -- Show relative line numbers from current
opt.numberwidth = 4       -- Min columns for line number display
opt.signcolumn = "yes"    -- Always show sign column
opt.cursorline = true     -- Highlight current cursor line

-- 🎛️ POPUP & WINDOW BEHAVIOR
opt.pumheight = 10        -- Max items in popup menu
opt.winminheight = 1      -- Min height for non-current windows
opt.equalalways = false   -- Don't auto-resize windows after split/close
opt.winheight = 20        -- Min height for current window
opt.helpheight = 15       -- Initial height of help window

-- 📏 SCROLLING & VIEWPORT
opt.scrolloff = 4         -- Min lines above/below cursor
opt.sidescrolloff = 8     -- Min columns left/right of cursor
opt.wrap = false          -- Don't wrap long lines
opt.linebreak = true      -- Break lines at word boundaries when wrapping

-- 📂 CODE FOLDING CONFIGURATION
opt.foldmethod = "expr"   -- Use treesitter for folding (more modern)
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.fillchars = {         -- Characters for statuslines and separators
  eob = " ",              -- Empty lines at end of buffer
  fold = " ",             -- Closed fold lines
  foldopen = " ",         -- Open fold indicator
  foldsep = " ",          -- Fold column separator
  foldclose = " ",        -- Closed fold indicator
  diff = "╱",             -- Deleted lines in diff mode
  msgsep = "‾",           -- Message separator
}

-- ⌨️ EDITING BEHAVIOR
opt.expandtab = true      -- Convert tabs to spaces
opt.tabstop = 2           -- Spaces per tab character
opt.shiftwidth = 2        -- Spaces per indentation level
opt.smartindent = true    -- Smart autoindenting on new lines
opt.conceallevel = 1      -- Conceal level for special syntax
opt.mouse = "a"           -- Enable mouse in all modes
opt.backspace = "indent,eol,start" -- Backspace behavior in insert mode

-- 🔍 SEARCH CONFIGURATION
opt.ignorecase = true     -- Case insensitive search
opt.smartcase = true      -- Case sensitive if uppercase in pattern
opt.hlsearch = true       -- Highlight all search matches
opt.incsearch = true      -- Show partial matches while typing

-- 📁 FILE & ENCODING
opt.fileencoding = "utf-8" -- File encoding for writing
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.report = 1            -- Threshold for reporting changed lines

-- 💾 BACKUP & RECOVERY
opt.backup = false        -- Don't create backup files
opt.writebackup = false   -- Don't create backup before overwrite
opt.swapfile = false      -- Don't use swap files
opt.undofile = true       -- Save undo history to file
opt.undodir = vim.fn.stdpath("cache") .. "/undo" -- Undo files directory

-- 📝 COMPLETION BEHAVIOR
opt.completeopt = { "menuone", "noselect" } -- Insert mode completion options

-- 🎨 VISUAL APPEARANCE & COLORS
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.pumblend = 10         -- Popup menu transparency (0=opaque, 100=transparent)
opt.winblend = 0          -- Floating window transparency
opt.guifont = "monospace:h17" -- Font for graphical Neovim

-- 🎯 SPLIT WINDOW BEHAVIOR
opt.splitbelow = true     -- Horizontal splits go below current
opt.splitright = true     -- Vertical splits go right of current

-- 📝 TEXT FORMATTING
opt.formatoptions:remove({ "c", "r", "o" }) -- Remove auto-commenting
opt.shortmess:append("c")  -- Hide completion match messages
opt.whichwrap:append("<,>,[,],h,l") -- Keys that wrap to next/prev line
opt.iskeyword:append("-") -- Treat hyphenated words as single words
