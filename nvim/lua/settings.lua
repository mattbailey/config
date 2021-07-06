vim.cmd('syntax off') -- syntax highlighting, let treesitter handle it
vim.cmd('set termguicolors') -- truecolor support
vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"

vim.o.autoread=true
vim.o.showtabline=2               -- Always show buffer tabs
vim.o.hidden=true                     -- Allow multiple buffers to be open
vim.wo.wrap=false                      -- Don't wrap line
vim.wo.number=true
vim.wo.relativenumber=false
vim.o.cursorline=true                  -- Highlight current line
vim.o.splitbelow=true                  -- Hsplit below
vim.o.splitright=true                 -- Vsplit to the right
vim.cmd('set colorcolumn=' .. 80)
vim.o.hlsearch=false                  -- Don't highlight search matches
vim.o.ignorecase=true                  -- Default case insensitive search
vim.o.smartcase=true                   -- Case sensitive if search has a capital letter
vim.o.mouse="a"                     -- Enable mouse
vim.o.scrolloff=8                 -- Start scrolling before reaching the bottom
-- vim.cmd('set completeopt=menuone,noinsert,noselect')

-- Use undofile instead of swap files for history
vim.o.swapfile=false
vim.o.backup=false
vim.o.undodir=CACHE_PATH .. "/undodir/"
vim.o.undofile=true
vim.o.undolevels=1000

vim.cmd('set softtabstop=2 tabstop=2 shiftwidth=2')
vim.o.expandtab=true					-- Convert tabs to spaces
vim.o.smartindent=true                 -- Makes indenting smart
vim.o.autoindent=true                  -- Auto indent

vim.o.fileencoding="utf-8"          -- File encoding
vim.o.pumheight=10                -- Popup menu height
vim.o.cmdheight=1                 -- Space for cmd messages
vim.o.laststatus=2                -- Always display the status line
vim.o.conceallevel=0              -- Show `` in markdown files
vim.o.showmode=false                  -- Hide the editing mode
vim.o.writebackup=false               -- This is recommended by coc
vim.o.updatetime=300              -- Faster completion
vim.o.timeoutlen=500              -- By default timeoutlen is 1000 ms
vim.o.clipboard="unnamedplus"       -- Copy paste between vim and everything else
vim.wo.signcolumn="yes"


-- vim.o.guifont = Font
