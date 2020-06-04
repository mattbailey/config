filetype plugin indent on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
set autoindent
" Auto load file changes
set autoread
set background=dark
" backspace through everything in insert mode
set backspace=indent,eol,start
set backup
set backupdir=$HOME/.cache/nvim/backup
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
" start searching before return
set incsearch
set laststatus=2
set lazyredraw          " Wait to redraw
set list
set listchars=tab:▸\ ,trail:⊗,nbsp:▹,eol:¬
set mouse=a
set nocompatible
set nocursorcolumn      " Don't paint cursor column
set cursorline        " Don't paint cursor line
set noerrorbells
set nostartofline
set noswapfile
set number
set relativenumber
set ruler
" always show 8 lines below cursor
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
set noshowmode
set autowriteall

" Don't incr octals
set nrformats-=octal

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" enable preview window
set completeopt+=preview

" Delete comment character when joining commented lines
set formatoptions+=j

" To auto close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" near instant switch to normal mode, NOTE: means esc can't be used for sequences.
" this actually ended up being an iterm2 issue, if you enable this, things
" like \e don't work.
"set timeoutlen=10 ttimeoutlen=0

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

syntax on

autocmd FileType make setlocal noexpandtab
