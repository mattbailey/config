" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible
	if empty(glob('~/.config/vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs
	    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	  autocmd VimEnter * PlugInstall
	endif
endif

call plug#begin('~/.vim/plugged')

" Sensible
Plug 'tpope/vim-sensible'

" FZF
" Plug 'junegunn/fzf', { 'dir': '/usr/local/Cellar/fzf/HEAD', 'do': 'yes \| ./install' }
set rtp+=/usr/local/Cellar/fzf/HEAD
set rtp+=~/.local/src/fzf

Plug 'vasconcelloslf/vim-interestingwords'
Plug 'vim-utils/vim-interruptless'

" Syntastic
" Plug 'scrooloose/syntastic'

Plug 'unblevable/quick-scope'
" quick-scrope hack from: https://gist.github.com/cszentkiralyi/dc61ee28ab81d23a67aa
function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif

    let letter = nr2char(getchar())

    if needs_disabling
        QuickScopeToggle
    endif

    return a:movement . letter
endfunction

let g:qs_enable = 0

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

Plug 'junegunn/rainbow_parentheses.vim'
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

" List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]

"au VimEnter * RainbowParentheses

Plug 'haya14busa/incsearch.vim'

" Scratch
Plug 'mtth/scratch.vim'

" vimwiki
Plug 'vimwiki/vimwiki'

" Autocomplete brackets
Plug 'Raimondi/delimitMate'

" Indentation stuff
Plug 'Yggdroot/indentLine'
"let g:indentLine_enabled = 0
let g:indentLine_fileType = ['vim','raml','ruby','yaml','json','javascript','bash','sh','html','css','scss']
let g:indentLine_char = '│'
let g:indentLine_faster = 1
let g:indentLine_color_term = 239
"unlet! g:indentLine_color_term g:indentLine_color_gui

Plug 'tpope/vim-surround'
Plug 'einars/js-beautify'

" VimL extensions (OO)
Plug 'rizzatti/funcoo.vim'
Plug 'vim-scripts/genutils'

" Neomake
Plug 'benekastah/neomake'
let g:neomake_go_go_maker = {
      \ 'args': [ 'build' ],
      \ 'errorformat':
        \ '%W%f:%l: warning: %m,' .
        \ '%E%f:%l:%c:%m,' .
        \ '%E%f:%l:%m,' .
        \ '%C%\s%\+%m,' .
        \ '%-G#%.%#'
    \ }
let g:neomake_go_enabled_makers = ['golint', 'go']
autocmd! BufWritePost *.html,*.py,*.js,*.rb,*.go,*.json Neomake
" let g:neomake_javascript_jshint_maker = {
"    \ 'args': ['--verbose', '--extract', 'auto'],
"    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"    \ }
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_airline = 1
"autocmd FileType html set ft=javascript

" Coloring
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = '#777777'
" Automatically use limelight with goyo
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Better / search
Plug 'mtth/locate.vim'

" github interface
Plug 'junegunn/vim-github-dashboard', {'on': ['GHDashboard', 'GHActivity'] }

" JavaScript stuff
Plug 'maksimr/vim-jsbeautify', {'for': ['javascript', 'html']}
Plug 'einars/js-beautify', {'for': ['javascript', 'html']}
Plug 'guileen/vim-node-dict'
Plug 'vim-scripts/JavaScript-Indent', {'for': ['javascript', 'html']}
Plug 'jelera/vim-javascript-syntax', {'for': ['javascript', 'html']}
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'html']}
Plug 'mohitleo9/vim-fidget', {
  \ 'build' : {
  \   'unix' : 'sudo npm install',
  \   'mac'  : 'npm install',
  \ },
\}
Plug 'marijnh/tern_for_vim', {
  \ 'for': ['javascript', 'html'],
  \ 'build' : {
  \   'unix' : 'sudo npm install',
  \   'mac' : 'npm install'
  \ }
\}

" Utilitarian stuff
Plug 'chrisbra/Colorizer'
let g:colorizer_auto_color = 0

Plug 'scrooloose/nerdtree'
nmap \e :NERDTreeToggle<CR>
Plug 'tpope/vim-vinegar'

Plug 'rizzatti/dash.vim' " Adds :Dash documentation explorer
Plug 'rizzatti/greper.vim' " Adds :G using ag/ack/grep
Plug 'bruno-/vim-vertical-move'
Plug 'benmills/vimux'
" Plug 'mattboehm/vim-unstack'
" Plug 'mattboehm/vim-accordion'
Plug 'justinmk/vim-gtfo' " Adds gof got, normal mode
Plug 'ervandew/supertab'
Plug 'zhaocai/GoldenView.Vim' "Always have a nice view for vim split windows
let g:goldenview__enable_default_mapping = 0
nmap <silent> \l <Plug>GoldenViewSplit
nmap <silent> \m <Plug>GoldenViewSwitchMain
nmap <silent> \M <Plug>GoldenViewSwitchToggle

Plug 'bling/vim-airline'
let g:smartusline_string_to_highlight = '(%n) %f '
set laststatus=2 " Seperate lines for state and mode
let g:airline_powerline_fonts=1 " Powerline simbols. Hermit font support it
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
"let g:airline_detect_modified = 1
"let g:airline_detect_paste = 1
let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#hunks#enabled = 1
"let g:airline#extensions#hunks#non_zero_only = 1
"let g:airline#extensions#whitespace#enabled = 1

Plug 'justinmk/vim-sneak' " Normal mode binding s{char}{char} searching
let g:sneak#streak = 1

Plug 'JazzCore/ctrlp-cmatcher', {
  \ 'build' : {
  \   'unix' : './install.sh',
  \   'mac'  : 'CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments ./install.sh',
  \ },
\}
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<C-D>'
nmap ; :CtrlPBuffer<CR>
nnoremap <leader>. :CtrlPTag<cr>
" nmap ; :CtrlPMixed<CR>
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore "**/*.swp"
      \ --ignore "**/*.o"
      \ --ignore "**/*.so"
      \ -g ""'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_dotfiles = 1
let g:ctrlp_switch_buffer = 0

Plug 'nixon/vim-vmath' " visual math library
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

Plug 'editorconfig/editorconfig-vim'
" Plug 'jeetsukumaran/vim-markology' " Adds marks visualization
Plug 'osyo-manga/vim-over' " Adds :OverCommandLine live editing of expressions
Plug 'jaxbot/semantic-highlight.vim'
Plug 'ivyl/vim-bling' " Adds blinking to search
let g:bling_count = 5

Plug 'mbbill/undotree' " Adds complete undotree
nnoremap \u :UndotreeToggle<CR>
if has("persistent_undo")
  set undodir=$HOME/.cache/vimundo/
  set undofile
endif

" Misc development enhancements
Plug 'tpope/vim-dispatch' " Adds :make
Plug 'wellle/targets.vim'
Plug 'majutsushi/tagbar' " \g to open ctags tagbar
nmap \g :TagbarToggle<CR>
Plug 'tpope/vim-fugitive'
" Plug 'vim-scripts/perforce'
" let g:p4CheckOutDefault = 1

Plug 'mhinz/vim-signify' " Like gitgutter, but extended and supports other SCM
let g:signify_update_on_focusgained = 1
let g:signify_line_hilight = 1
let g:signify_vcs_list = [ 'git', 'hg' ]

" One-off syntax additions
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-markdown', {'for' : 'markdown'}
Plug 'vim-pandoc/vim-pandoc', {'for' : 'markdown'}
" Checking out neocomplete, don't use two syntax completion suites
" Plug 'Valloric/YouCompleteMe', {
"       \ 'build' : {
"       \     'cygwin' : './install.sh',
"       \     'mac' : './install.sh',
"       \     'unix' : './install.sh',
"       \    },
"       \ }
" NeoComplete requires OS X build with: brew install macvim --with-cscope --with-lua --HEAD
" Plug 'Shougo/neocomplete'
" if filereadable($HOME . "/.config/vim/neocomplete_config.vim")
"   source $HOME/.config/vim/neocomplete_config.vim
" endif

Plug 'vim-scripts/diffchar.vim'
Plug 'rking/ag.vim'

" Commentary
Plug 'tpope/vim-commentary'

" Tab completion
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

" CSV parsing
Plug 'chrisbra/csv.vim'

" Ruby stuff
Plug 'tpope/vim-rake', {'for' : 'ruby'}
Plug 'tpope/vim-cucumber', {'for' : 'ruby'}
Plug 'tpope/vim-bundler', {'for' : 'ruby'}
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby', {'for' : 'ruby'}

" Golang stuff
Plug 'fatih/vim-go', {'for' : 'go'}
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Colorschemes
Plug 'wellsjo/wells-colorscheme.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'ciaranm/inkpot'
Plug 'morhetz/gruvbox'
Plug 'zenorocha/dracula-theme', {'rtp' : './vim'}

" Semantic hilighting
Plug 'jaxbot/semantic-highlight.vim'
let g:semanticTermColors = [14,15,13,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201]
:nnoremap <Leader>s :SemanticHighlightToggle<cr>

Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()
