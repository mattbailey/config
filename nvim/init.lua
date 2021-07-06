-- Paths
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

-- Base configuration
require('plugins')
require('keymap')
require('settings')
require('functions')
require('colors')
require('auto')
require('plugins.indentblankline')

-- -- Plugin configs
-- vim.cmd('source ~/.config/nvim/lua/plugins/whichkey.vim')
vim.cmd('source ~/.config/nvim/lua/plugins/markdown-preview.vim')
