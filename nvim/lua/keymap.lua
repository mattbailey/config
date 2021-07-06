 local map = vim.api.nvim_set_keymap
-- ================================ LEADER ====================================
-- unmap space and set it as the leader key
map('n', '\\', '<NOP>', { noremap=true, silent=true })
vim.g.mapleader = '\\'

-- ================================ GLOBAL ====================================
-- ctrl-a to beignning of line
map('c', '<c-a>', '<Home>', {noremap=true, silent=true})

-- ================================ NORMAL ====================================
-- visual block mode
map('n', 'q', '<c-v>', {noremap = true, silent = true})

-- Split navigation
map('n', '<M-h>', '<C-w>h', { silent=true })
map('n', '<M-j>', '<C-w>j', { silent=true })
map('n', '<M-k>', '<C-w>k', { silent=true })
map('n', '<M-l>', '<C-w>l', { silent=true })

-- Buffer navigation
map('n', '<C-n>', ':BufferNext<CR>', { noremap=true, silent=true })
map('n', '<C-p>', ':BufferPrevious<CR>', { noremap=true, silent=true })
map('n', '<BS>', ':BufferLast<CR>', { noremap=true, silent=true })

-- File navigation
map('n', '<C-y>', '3<C-y>', { noremap=true, silent=true })
map('n', '<C-e>', '3<C-e>', { noremap=true, silent=true })

-- Resizing
map('n', '<C-Up>', ':resize +2<CR>', { noremap=true, silent=true })
map('n', '<C-Down>', ':resize -2<CR>', { noremap=true, silent=true })
map('n', '<C-Right>', ':vert resize +2<CR>', { noremap=true, silent=true })
map('n', '<C-Left>', ':vert resize -2<CR>', { noremap=true, silent=true })

-- LSP
map('n', 'K', ':Lspsaga hover_doc<CR>', { noremap=true, silent=true })
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap=true, silent=true })
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap=true, silent=true })
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap=true, silent=true })
map('n', 'gF', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap=true, silent=true })
map('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap=true, silent=true })
-- map('n', 'ca', ':Lspsaga code_action<CR>', { noremap=true, silent=true })
-- map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap=true, silent=true })
-- map('n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>', { noremap=true, silent=true })
map('n', '<C-t>', ':Lspsaga diagnostic_jump_next<CR>', { noremap=true, silent=true })
-- scroll down hover doc or scroll in definition preview
map('n', '<C-j>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', { noremap=true, silent=true })
-- scroll up hover doc
map('n', '<C-k>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', { noremap=true, silent=true })

-- File Tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap=true, silent=true})
map('n', '<leader>f', ':NvimTreeFindFile<CR>', {noremap=true, silent=true})

-- Telescope
map('n', '<C-d>', ":lua require'telescope.builtin'.find_files{}<CR>", {noremap=true, silent=true})
map('n', '<C-b>', ":lua require'telescope.builtin'.buffers{}<CR>", {noremap=true, silent=true})
map('n', '<C-f>', ":lua require'telescope.builtin'.live_grep{}<CR>", {noremap=true, silent=true})
map('n', '<C-g>', ":lua require'telescope.builtin'.grep_string{}<CR>", {noremap=true, silent=true})
map('n', '<C-l>', ":lua require'telescope.builtin'.lsp_dynamic_workspace_symbols{}<CR>", {noremap=true, silent=true})
map('n', '<leader>f', ":lua require'telescope.builtin'.file_browser{}<CR>", {noremap=true, silent=true})

-- ================================ INSERT ====================================

-- Make Ctrl-e jump to the end of the current line in the insert mode.
map('i', '<c-e>', '<c-o>$', {noremap=true, silent=true})

-- ================================ VISUAL ====================================

-- Indenting
map('v', '<', '<gv', { noremap=true, silent=true })
map('v', '>', '>gv', { noremap=true, silent=true })

-- Move line
map('v', 'K', ':m \'>-2<CR>gv-gv', { noremap=true, silent=true })

-- ================================ UNMAP =====================================
map('n', 'Q', '<NOP>', { noremap=true, silent=true })
