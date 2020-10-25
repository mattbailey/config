" ==================================================
" vim-plug  setup
" ==================================================
if has('nvim')
  call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Colorschemes
" Plug 'morhetz/gruvbox'
" Plug 'ajmwagar/vim-deus'
Plug 'kaicataldo/material.vim'

" statusline
Plug 'itchyny/lightline.vim'

" hilight interesting words
"   Highlight with <Leader>k
"   Navigate with n and N
"   Clear highlights with <Leader>K
Plug 'vasconcelloslf/vim-interestingwords'

" last place in file
Plug 'farmergreg/vim-lastplace'

" cleans up search hilights
Plug 'romainl/vim-cool'

Plug 'duggiefresh/vim-easydir'       | " Create files in dirs that don't exist

" Command sugar
Plug 'tpope/vim-eunuch'

" Hilights containing paren pairs
Plug 'Yggdroot/hiPairs'

" :BUN :BD :BW, maintins splits
Plug 'qpkorr/vim-bufkill'

" nice window resizing
Plug 'camspiers/lens.vim'

" Fast f & t motions
Plug 'unblevable/quick-scope'

" Stops less useful interruptions
Plug 'vim-utils/vim-interruptless'

" File type icons
Plug 'ryanoasis/vim-devicons'

" Indentation indicators
Plug 'nathanaelkane/vim-indent-guides'

Plug 'blueyed/vim-diminactive'         | " Helps identifying active window

Plug 'haorenW1025/floatLf-nvim'
let g:floatLf_autoclose = 1

" Colorizes various color-codes in vim
Plug 'chrisbra/Colorizer'

" Editorconfig auto-formatting
Plug 'editorconfig/editorconfig-vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Git linking
Plug 'ruanyl/vim-gh-line'

" Like gitgutter, but extended and supports other SCM
Plug 'mhinz/vim-signify'

" Easymotion
" <Leader>f{char} to move to {char}
" s{char}{char} to move to {char}{char}
" Move to line <leader>L
" Move to word <leader>wW
Plug 'easymotion/vim-easymotion'

" searching
" Plug 'jremmen/vim-ripgrep', { 'do': 'brew install ripgrep' }

" Github Dashboard
Plug 'junegunn/vim-github-dashboard', {'on': ['GHDashboard', 'GHActivity'] }

" Nerdtree
" Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Nerdtree git stuff
Plug 'Xuyuanp/nerdtree-git-plugin'

" Undo tree
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

" additional text targets for motions
Plug 'wellle/targets.vim'

" Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'

" Fuzzy searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Comment parsing
Plug 'tpope/vim-commentary'

" comments
Plug 'scrooloose/nerdcommenter'

" Autocomplete brackets
Plug 'Raimondi/delimitMate'

" hilight occurances of element under cursor
Plug 'RRethy/vim-illuminate'

" delimit autocomplete for other langs
Plug 'tpope/vim-surround'

" Unfold arguments/arrays/etc
Plug 'FooSoft/vim-argwrap'

" Markdown support
Plug 'tpope/vim-markdown', {'for' : 'markdown'}

" Markdown preview
Plug 'davinche/godown-vim', {'for': 'markdown'}

" Pandoc converter support
Plug 'vim-pandoc/vim-pandoc', {'for' : ['markdown','pandoc']}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for' : ['markdown','pandoc']}

" Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

" prototool support
"Plug 'mattbailey/prototool', { 'rtp':'vim/prototool', 'for': 'proto' }

" ALE linting & formatting
" Commenting out for now, doesn't necissarily conflict with nvim-lsp, but
"   will probably be superceded, as there is a vim.lsp.buf.formatting()
"   function
"Plug 'dense-analysis/ale'

" blinky search
Plug 'ivyl/vim-bling' " Adds blinking to search

" Javascript node dictionary
Plug 'guileen/vim-node-dict', {'for': ['javascript', 'html', 'javascript.jsx']}

" Go
Plug 'fatih/vim-go', {'do': ':silent :GoUpdateBinaries'}
"Plug 'jodosha/vim-godebug', {'for' : 'go', 'do': 'go get -u github.com/go-delve/delve/cmd/dlv'}

" plist
Plug 'darfink/vim-plist'

" file manager
Plug 'vifm/vifm.vim'

" quickfix settings
Plug 'romainl/vim-qf'

" auto context folding
" Plug 'wellle/context.vim'

" strips whitespace on only lines that you modify
Plug 'axelf4/vim-strip-trailing-whitespace'

" tons of language support plugins
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = [
      \ 'go',
      \]

" Very good tag manager
" brew install --with-jansson universal-ctags/universal-ctags/universal-ctags
" Plug 'liuchengxu/vista.vim'

" Floating filer.
" Should insatll: rg git fd vista.vim
" The bang version will try to download the prebuilt binary if cargo does not exist.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" newer floating term/window with plugins.
Plug 'voldikss/vim-floaterm'

" file encryption
Plug 'hauleth/vim-encpipe'

" awww yissssss built in LSP support in neovim >=0.5.0
Plug 'neovim/nvim-lsp'

" statusline lsp
Plug 'wbthomason/lsp-status.nvim'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" LSP completion
Plug 'haorenW1025/completion-nvim'

" Changes how diagnostics are visually shown for neovim-lsp
Plug 'haorenW1025/diagnostic-nvim'

" color vars different colors
Plug 'jaxbot/semantic-highlight.vim'

" So SQLComplete works
Plug 'vim-scripts/dbext.vim'

call plug#end()
