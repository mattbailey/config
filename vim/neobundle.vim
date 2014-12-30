" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle 'MattesGroeger/vim-bookmarks'

NeoBundle 'mtth/scratch.vim'
NeoBundle 'Yggdroot/indentLine'
"let g:indentLine_enabled = 0
let g:indentLine_fileType = ['vim','ruby','yaml','json','javascript','bash','sh','html','css','scss']
let g:indentLine_char = '│'
let g:indentLine_faster = 1
let g:indentLine_color_term = 239

"au FileType  IndentLinesEnable


"NeoBundle 'nathanaelkane/vim-indent-guides'
"au FileType vim,ruby,yaml,json,javascript,bash,sh,html,css,scss IndentGuidesEnable
"let indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey ctermbg=52
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=55
"let indent_guides_color_change_percent = 10

" VimL extensions (OO)
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'vim-scripts/genutils'

" Vim async Proc support
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Another VimL extension 'self', required for vimside scala plugin
" NeoBundle 'megaannum/self'
" NeoBundle 'megaannum/forms' " self language forms plugin

NeoBundle 'junegunn/goyo.vim'
NeoBundle 'junegunn/limelight.vim'
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = '#777777'
" Automatically use limelight with goyo
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Better / search
"NeoBundle 'junegunn/vim-pseudocl'
"NeoBundle 'junegunn/vim-oblique'
NeoBundle 'mtth/locate.vim'

" github interface
NeoBundle 'junegunn/vim-github-dashboard'

" JavaScript stuff
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'mohitleo9/vim-fidget', {
  \ 'build' : {
  \   'unix' : 'sudo npm install',
  \   'mac'  : 'npm install',
  \ },
\}

" Utilitarian stuff
NeoBundle 'chrisbra/Colorizer'
let g:colorizer_auto_color = 0

NeoBundle 'scrooloose/nerdtree'
nmap \e :NERDTreeToggle<CR>
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/vimfiler.vim'
" nmap \e :VimFilerExplorer<CR>
" let g:vimfiler_as_default_explorer = 1

NeoBundle 'rizzatti/dash.vim' " Adds :Dash documentation explorer
NeoBundle 'rizzatti/greper.vim' " Adds :G using ag/ack/grep
NeoBundle 'bruno-/vim-vertical-move'
NeoBundle 'benmills/vimux'
" NeoBundle 'mattboehm/vim-unstack'
" NeoBundle 'mattboehm/vim-accordion'
NeoBundle 'justinmk/vim-gtfo' " Adds gof got, normal mode
NeoBundle 'ervandew/supertab'
NeoBundle 'zhaocai/GoldenView.Vim' "Always have a nice view for vim split windows
let g:goldenview__enable_default_mapping = 0
nmap <silent> \l <Plug>GoldenViewSplit
nmap <silent> \m <Plug>GoldenViewSwitchMain
nmap <silent> \M <Plug>GoldenViewSwitchToggle

NeoBundle 'bling/vim-airline'
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

NeoBundle 'justinmk/vim-sneak' " Normal mode binding s{char}{char} searching
let g:sneak#streak = 1

NeoBundle 'ctrlpvim/ctrlp.vim'
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

NeoBundle 'nixon/vim-vmath' " visual math library
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

NeoBundle 'editorconfig/editorconfig-vim'
" NeoBundle 'jeetsukumaran/vim-markology' " Adds marks visualization
NeoBundle 'osyo-manga/vim-over' " Adds :OverCommandLine live editing of expressions
NeoBundle 'jaxbot/semantic-highlight.vim'
NeoBundle 'ivyl/vim-bling' " Adds blinking to search
let g:bling_count = 5

NeoBundle 'mbbill/undotree' " Adds complete undotree
nnoremap \u :UndotreeToggle<CR>
if has("persistent_undo")
  set undodir='~/.cache/vimundo/'
  set undofile
endif

" Misc development enhancements
NeoBundle 'tpope/vim-dispatch' " Adds :make
NeoBundle 'wellle/targets.vim'
NeoBundle 'majutsushi/tagbar' " \g to open ctags tagbar
nmap \g :TagbarToggle<CR>
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'vim-scripts/perforce'
" let g:p4CheckOutDefault = 1

NeoBundle 'mhinz/vim-signify' " Like gitgutter, but extended and supports other SCM
let g:signify_update_on_focusgained = 1
let g:signify_line_hilight = 1

" One-off syntax additions
NeoBundle 'sheerun/vim-polyglot'
" NeoBundleLazy 'suan/vim-instant-markdown', {'autoload':{'filetypes':['ruby']}}
NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}
" Checking out neocomplete, don't use two syntax completion suites
" NeoBundle 'Valloric/YouCompleteMe', {
"       \ 'build' : {
"       \     'cygwin' : './install.sh',
"       \     'mac' : './install.sh',
"       \     'unix' : './install.sh',
"       \    },
"       \ }
" NeoComplete requires OS X build with: brew install macvim --with-cscope --with-lua --HEAD
NeoBundle 'Shougo/neocomplete'
if filereadable($HOME . "/.config/vim/neocomplete_config.vim")
  source $HOME/.config/vim/neocomplete_config.vim
endif

NeoBundle 'chrisbra/csv.vim'
" NeoBundle 'scrooloose/syntastic'
" let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" NeoBundle 'megaannum/vimside' " Scala ENSIME IDE stuff, requires self & forms

" Snippets
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" Ruby stuff
NeoBundleLazy 'tpope/vim-rake', {'autoload':{'filetypes':['ruby']}}
NeoBundleLazy 'tpope/vim-cucumber', {'autoload':{'filetypes':['ruby']}}
NeoBundleLazy 'tpope/vim-bundler', {'autoload':{'filetypes':['ruby']}}
NeoBundleLazy 'tpope/vim-endwise', {'autoload':{'filetypes':['ruby']}}
NeoBundleLazy 'vim-ruby/vim-ruby', {'autoload':{'filetypes':['ruby']}}

" Golang stuff
NeoBundleLazy 'fatih/vim-go', {'autoload':{'filetypes':['go']}}

" Colorschemes
NeoBundle 'nanotech/jellybeans.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
