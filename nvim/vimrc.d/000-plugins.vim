" ==================================================
" vim-plug  setup
" ==================================================
if has('nvim')
  call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'kaicataldo/material.vim'

" statusline
Plug 'itchyny/lightline.vim'

" hilight interesting words
"   Highlight with <Leader>k
"   Navigate with n and N
"   Clear highlights with <Leader>K
Plug 'vasconcelloslf/vim-interestingwords'

" Command sugar
Plug 'tpope/vim-eunuch'

" :BUN :BD :BW, maintins splits
Plug 'qpkorr/vim-bufkill'

" nice window resizing
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

" Stops less useful interruptions
Plug 'vim-utils/vim-interruptless'

" File type icons
Plug 'ryanoasis/vim-devicons'

" Colorizes various color-codes in vim
Plug 'chrisbra/Colorizer'

" Editorconfig auto-formatting
Plug 'editorconfig/editorconfig-vim'

" Git integration
Plug 'tpope/vim-fugitive'

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
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

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

" delimit autocomplete for other langs
Plug 'tpope/vim-surround'

" Unfold arguments/arrays/etc
Plug 'FooSoft/vim-argwrap'

" Markdown support
Plug 'tpope/vim-markdown', {'for' : 'markdown'}

" Markdown preview
Plug 'davinche/godown-vim', {'for': 'markdown'}

" Pandoc converter support
Plug 'vim-pandoc/vim-pandoc', {'for' : 'markdown'}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for' : 'markdown'}

" Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

" prototool support
Plug 'mattbailey/prototool', { 'rtp':'vim/prototool', 'for': 'proto' }

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
Plug 'liuchengxu/vista.vim'

" Floating filer.
" Should insatll: rg git fd vista.vim
" The bang version will try to download the prebuilt binary if cargo does not exist.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" awww yissssss built in LSP support in neovim >=0.5.0
Plug 'neovim/nvim-lsp'

" Changes how diagnostics are visually shown for neovim-lsp
Plug 'haorenW1025/diagnostic-nvim'

" Tab completion, supports many sources, including omnicomplete, to work with
"   nvim-lsp
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'

" color vars different colors
Plug 'jaxbot/semantic-highlight.vim'

call plug#end()
