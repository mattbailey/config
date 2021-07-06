local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Autocompile
vim.cmd 'autocmd BufWritePost init.lua PackerCompile'

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- colorscheme
  -- use {'marko-cerovac/material.nvim', branch = 'pure-lua'}
  -- use 'shaunsingh/nord.nvim'
  use 'shaunsingh/moonlight.nvim' -- purpley colorscheme
  use 'savq/melange' -- warm colorscheme
  -- use 'siduck76/nvim-base16.lua'
  -- Whichkey (replace with lua when possible)
  -- use 'liuchengxu/vim-which-key'
  -- -- devicons
  use 'kyazdani42/nvim-web-devicons'
  use { -- Dispatch
    'tpope/vim-dispatch',
    cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
  }
  use { -- treesitter
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins.treesitter') end,
  }
  -- -- strips whitespace on only lines that you modify
  use 'axelf4/vim-strip-trailing-whitespace'
  -- -- extends % for better matching XXX: maybe slow?
  -- use {'andymass/vim-matchup', event = 'VimEnter'}
  -- -- cleans up search hilights
  use 'romainl/vim-cool'
  -- -- better buffer killing
  use 'qpkorr/vim-bufkill'
  -- -- dim inactive windows
  use 'blueyed/vim-diminactive'
  -- -- colorizes colorcodes
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('plugins.colorizer') end
  }
  -- -- editorconfig
  use 'editorconfig/editorconfig-vim'
  -- -- undotree
  use {'mbbill/undotree', cmd = 'UndotreeToggle'}
  -- -- motion targets
  -- use 'wellle/targets.vim'
  -- -- yank highlights
  use 'machakann/vim-highlightedyank'

  use { -- comment plugin
    'b3nj5m1n/kommentary',
    config = function() require('plugins.kommentary') end,
  }
  use {
    'simrat39/symbols-outline.nvim',
    config = function() require('plugins.symbols-outline') end,
  }
  -- -- blinky search
  use 'ivyl/vim-bling'
  -- -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lsp.config') end
  }
  use { -- Enhance built in LSP functions
    'RishabhRD/nvim-lsputils',
    requires = {'RishabhRD/popfix'},
    config = function() require('plugins.lsp.utils') end
  }
  use { -- lsp completion
    'hrsh7th/nvim-compe',
    config = function() require('plugins.lsp.compe') end
  }
  use { -- For icons in completion
    'onsails/lspkind-nvim',
    config = function() require('lspkind').init({with_text = true}) end
  }
  use 'nvim-lua/lsp-status.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/vim-vsnip'
  use 'ray-x/lsp_signature.nvim'
  use { -- Simple lsp enhancements
    'nvim-lua/lsp_extensions.nvim',
    config = function() require 'plugins.lsp.extensions' end
  }
  -- -- use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
  -- -- Autocomlete
  use {
    'windwp/nvim-autopairs',
    config = function() require('plugins.autopairs') end
  }
  use { -- telescope
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
    config = function() require('plugins.telescope') end,
  }
  use {
    'nvim-telescope/telescope-media-files.nvim',
    requires = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('media_files') end
  }
  use { -- Dap integration for telescope
    'nvim-telescope/telescope-dap.nvim',
    requires = {'nvim-telescope/telescope.nvim'}
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  -- -- Dashboard
  use { -- dashboard
    'glepnir/dashboard-nvim',
    config = function() require('plugins.dashboard') end,
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require('trouble').setup() end
  }
  -- -- QuickFix
  use 'kevinhwang91/nvim-bqf'
  -- -- Debugger
  use 'mfussenegger/nvim-dap'
  -- -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('plugins.tree') end
  }

  use { -- git status lines
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.gitsigns') end,
  }
  use 'arkav/lualine-lsp-progress'
  use { -- Nice bar
    'hoob3rt/lualine.nvim',
    config = function() require 'plugins.lualine' end
  }
  use 'romgrk/barbar.nvim'
  use { -- intent line prettyness
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
    config = function() require('plugins.indentblankline') end,
  }
  -- -- Language Specific
  -- -- Markdown
  use { -- markdown preview
    'iamcco/markdown-preview.nvim',
    ft = {'markdown'},
    run=':call mkdp#util#install()',
    cmd = 'MarkdownPreview'
  }
  use { -- markdown syntax
    'tpope/vim-markdown',
    ft = {'markdown'}
  }
  -- use {'vim-pandoc/vim-pandoc', ft = {'markdown', 'pandoc'}}
  -- use {'vim-pandoc/vim-pandoc-syntax', ft = {'markdown', 'pandoc'}}
  -- -- Go
  -- -- use {'fatih/vim-go', ft={'go'}, run=':silent :GoUpdateBinaries'}
  -- -- Rust
  -- use {'simrat39/rust-tools.nvim', ft={'rust'}}
end)
