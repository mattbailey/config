" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible
  " Load vim-plug
  if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  endif
endif

call plug#begin('~/.vim/plugged')

" Sensible
Plug 'tpope/vim-sensible'

" Scratch
Plug 'mtth/scratch.vim'

" Indentation stuff
Plug 'Yggdroot/indentLine'
"let g:indentLine_enabled = 0
let g:indentLine_fileType = ['vim','ruby','yaml','json','javascript','bash','sh','html','css','scss']
let g:indentLine_char = '│'
let g:indentLine_faster = 1
let g:indentLine_color_term = 239

" VimL extensions (OO)
Plug 'rizzatti/funcoo.vim'
Plug 'vim-scripts/genutils'

" Neomake
Plug 'benekastah/neomake'

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
Plug 'jelera/vim-javascript-syntax', {'for' : 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for' : 'javascript'}
Plug 'mohitleo9/vim-fidget', {
  \ 'build' : {
  \   'unix' : 'sudo npm install',
  \   'mac'  : 'npm install',
  \ },
\}

" Utilitarian stuff
Plug 'chrisbra/Colorizer'
let g:colorizer_auto_color = 0

Plug 'scrooloose/nerdtree'
nmap \e :NERDTreeToggle<CR>

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
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#whitespace#enabled = 1

Plug 'justinmk/vim-sneak' " Normal mode binding s{char}{char} searching
let g:sneak#streak = 1

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<C-D>'
nmap ; :CtrlPBuffer<CR>
nnoremap <leader>. :CtrlPTag<cr>
" nmap ; :CtrlPMixed<CR>
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
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
  set undodir='~/.cache/vimundo/'
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

" One-off syntax additions
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-markdown', {'for' : 'markdown'}
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

Plug 'chrisbra/csv.vim'

" Ruby stuff
Plug 'tpope/vim-rake', {'for' : 'ruby'}
Plug 'tpope/vim-cucumber', {'for' : 'ruby'}
Plug 'tpope/vim-bundler', {'for' : 'ruby'}
Plug 'tpope/vim-endwise', {'for' : 'ruby'}
Plug 'vim-ruby/vim-ruby', {'for' : 'ruby'}

" Golang stuff
Plug 'fatih/vim-go', {'for' : 'go'}

" Colorschemes
Plug 'nanotech/jellybeans.vim'

call plug#end()
