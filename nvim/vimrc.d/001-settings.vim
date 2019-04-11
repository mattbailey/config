filetype plugin indent on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set backup
set backupdir=$HOME/.cache/vim
set breakindent
set clipboard=unnamed
set copyindent
set encoding=utf-8
set expandtab
set fileformats=unix,dos,mac
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw          " Wait to redraw
set list
set listchars=tab:▸\ ,trail:⊗,nbsp:▹,eol:¬
set mouse=a
set nocompatible
set nocursorcolumn      " Don't paint cursor column
set nocursorline        " Don't paint cursor line
set noerrorbells
set nostartofline
set noswapfile
set number
set relativenumber
set ruler
set scrolloff=8
set shiftround
set showcmd
set smartcase
set softtabstop=2 tabstop=2 shiftwidth=2
set termguicolors
set title
set ttyfast
set undodir=$HOME/.cache/nvim/vim_undo/
set undofile
set undolevels=1000
set visualbell
set wildignore=*.swp,*.bak
syntax on


autocmd FileType make setlocal noexpandtab
