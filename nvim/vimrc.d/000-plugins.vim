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

" hilight interesting words
"   Highlight with <Leader>k
"   Navigate with n and N
"   Clear highlights with <Leader>K
Plug 'vasconcelloslf/vim-interestingwords'

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

" GitHub integration
Plug 'tpope/vim-rhubarb', {'do': 'brew install hub'}

" Like gitgutter, but extended and supports other SCM
Plug 'mhinz/vim-signify' 

" Easymotion
" <Leader>f{char} to move to {char}
" s{char}{char} to move to {char}{char}
" Move to line <leader>L
" Move to word <leader>wW
Plug 'easymotion/vim-easymotion'

" searching
Plug 'jremmen/vim-ripgrep', { 'do': 'brew install ripgrep' }

" Github Dashboard
Plug 'junegunn/vim-github-dashboard', {'on': ['GHDashboard', 'GHActivity'] }

" Nerdtree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Nerdtree git stuff
Plug 'Xuyuanp/nerdtree-git-plugin'

" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Undo tree
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

" additional text targets for motions
Plug 'wellle/targets.vim'

" Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'

" Tagbar
Plug 'majutsushi/tagbar' " \g to open ctags tagbar

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

" tons of language support plugins
Plug 'sheerun/vim-polyglot', {'do': './build'}

" Markdown support
Plug 'tpope/vim-markdown', {'for' : 'markdown'}

" Markdown preview
Plug 'davinche/godown-vim', {'for': 'markdown'}

" Pandoc converter support
Plug 'vim-pandoc/vim-pandoc', {'for' : 'markdown'}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for' : 'markdown'}

" language server implementation
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

" prototool support
Plug 'uber/prototool', { 'rtp':'vim/prototool', 'for': 'proto' }

" ALE linting & formatting
Plug 'w0rp/ale'

" blinky search
Plug 'ivyl/vim-bling' " Adds blinking to search

" color vars different colors
Plug 'jaxbot/semantic-highlight.vim'

" Javascript node dictionary
Plug 'guileen/vim-node-dict', {'for': ['javascript', 'html', 'javascript.jsx']}

"let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

" Go
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
"Plug 'jodosha/vim-godebug', {'for' : 'go', 'do': 'go get -u github.com/go-delve/delve/cmd/dlv'}

" SYNTAX FORCE
" END SYNTAX FORCE

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-x>'
let g:ctrlp_cmd = 'CtrlP'

call plug#end()
