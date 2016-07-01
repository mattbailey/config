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

call plug#begin('~/.vim/bundle')

" COLORSCHEMES
"Plug 'zenorocha/dracula-theme', {'rtp' : './vim'}

Plug 'frankier/neovim-colors-solarized-truecolor-only'

Plug 'whatyouhide/vim-gotham'

Plug 'morhetz/gruvbox'
" END COLORSCHEMES

" BASE
Plug 'vasconcelloslf/vim-interestingwords'

Plug 'vim-utils/vim-interruptless'

Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-sensible'

Plug 'justinmk/vim-gtfo' " Adds gof got, normal mode

Plug 'Yggdroot/indentLine' " Shows indentation lines
"let g:indentLine_enabled = 0
let g:indentLine_fileType = ['vim','raml','ruby','yaml','json','javascript','bash','sh','html','css','scss','jsx','tag']
let g:indentLine_char = '│'
let g:indentLine_faster = 1
let g:indentLine_color_term = 239
"unlet! g:indentLine_color_term g:indentLine_color_gui

Plug 'chrisbra/Colorizer'
let g:colorizer_auto_color = 0

Plug 'ervandew/supertab'

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-fugitive'

Plug 'mhinz/vim-signify' " Like gitgutter, but extended and supports other SCM
let g:signify_update_on_focusgained = 1
let g:signify_line_hilight = 1
let g:signify_vcs_list = [ 'git', 'hg' ]

" Plug 'jeetsukumaran/vim-markology' " Adds marks visualization

Plug 'junegunn/goyo.vim'

Plug 'junegunn/limelight.vim'
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = '#777777'
" Automatically use limelight with goyo
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

Plug 'easymotion/vim-easymotion'
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

Plug 'junegunn/vim-easy-align'
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
" END BASE

" TOOLS
Plug 'vim-scripts/diffchar.vim'

Plug 'rking/ag.vim'

Plug 'benmills/vimux'

Plug 'junegunn/vim-github-dashboard', {'on': ['GHDashboard', 'GHActivity'] }

Plug 'SirVer/ultisnips'

Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
nmap \e :NERDTreeToggle<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'

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
"autocmd! BufWritePre *.tag,*.html,*.py,*.js,*.rb,*.go,*.json WatchForChanges
autocmd! BufWritePost *.tag,*.html,*.py,*.js,*.rb,*.go,*.json Neomake
" let g:neomake_javascript_jshint_maker = {
"    \ 'args': ['--verbose', '--extract', 'auto'],
"    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"    \ }
let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_javascript_eslint_maker = {'args': ['--fix']}
let g:neomake_airline = 1
"autocmd FileType html set ft=javascript
"autocmd FileType tag set ft=javascript
"autocmd FileType jsx set ft=javascript

nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

Plug 'mbbill/undotree', {'on': 'UndotreeToggle'} " Adds complete undotree
nnoremap \u :UndotreeToggle<CR>
if has("persistent_undo")
  set undodir=$HOME/.cache/vimundo/
  set undofile
endif

Plug 'tpope/vim-dispatch' " Adds :make

Plug 'wellle/targets.vim'

Plug 'majutsushi/tagbar' " \g to open ctags tagbar
nmap \g :TagbarToggle<CR>

" Plug 'vim-scripts/perforce'
" let g:p4CheckOutDefault = 1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

if executable('ag')
    let $FZF_DEFAULT_COMMAND='ag -g ""'
endif
"set rtp+=/usr/local/Cellar/fzf/HEAD
"set rtp+=~/.local/src/fzf
imap <c-x><c-l> <plug>(fzf-complete-line)
map ; <esc>:FZF -m<cr>
nmap <BS> :b#<CR>
map <c-d> <esc>:Files<cr>
map <c-f> <esc>:Ag 

" END TOOLS


" BASE CODE
Plug 'kana/vim-textobj-user'

Plug 'kana/vim-textobj-indent'

Plug 'tpope/vim-commentary'

Plug 'osyo-manga/vim-over' " Adds :OverCommandLine live editing of expressions

Plug 'Raimondi/delimitMate' " Autocomplete brackets

Plug 'tpope/vim-surround' " delimit autocomplete for other langs

Plug 'FooSoft/vim-argwrap' " Unfold arguments/arrays/etc
nnoremap <silent> <leader>a :ArgWrap<CR>

Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['javascript']

Plug 'tpope/vim-markdown', {'for' : 'markdown'}

Plug 'davinche/godown-vim', {'for': 'markdown'}

Plug 'vim-pandoc/vim-pandoc', {'for' : 'markdown'}

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_async = 1
let g:easytags_languages = {
\   'javascript': {
\     'cmd': '/usr/local/bin/jsctags',
\       'args': [],
\       'fileoutput_opt': '-f',
\       'stdout_opt': '-f-',
\       'recurse_flag': '-R'
\   }
\}

Plug 'christoomey/vim-sort-motion'
"gs2j => Sort down two lines (current + 2 below)
"gsip => Sort the current paragraph
"gsii => Sort the current indentation level
"gs (visual)

Plug 'tomtom/tcomment_vim' " Comment wrapper
" gc & gcap (paragraph)

Plug 'm42e/vim-gcov-marker' " Code coverage marker

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1


" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#mappings#close_popup() . "\<CR>"
endfunction
" END BASE CODE

" SEARCH
Plug 'ivyl/vim-bling' " Adds blinking to search
let g:bling_count = 5

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
" END SEARCH

" JAVASCRIPT
"Plug 'pangloss/vim-javascript', {'for': ['javascript', 'html']}

Plug 'othree/yajs.vim'

"Plug 'luochen1990/rainbow', { 'for': ['javascript','html','tag','jsx'] }
let g:rainbow_active = 1

"Plug 'mxw/vim-jsx', { 'for': ['javascript','html','tag','jsx'] }

"Plug 'nicklasos/vim-jsx-riot', { 'for': ['javascript','html','tag','jsx'] }

Plug 'othree/es.next.syntax.vim'

Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'chai'

"Plug 'maksimr/vim-jsbeautify', { 'for': ['javascript','html','tag','jsx'] }
autocmd FileType javascript vnoremap <buffer> F :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> F :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> F :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> F :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> F :call RangeCSSBeautify()<cr>
"nnoremap <c-f> V<c-f>

"Plug 'guileen/vim-node-dict', {'for': ['javascript', 'html']}

"Plug 'moll/vim-node', {'for': ['javascript', 'html']}

Plug 'vim-scripts/JavaScript-Indent', { 'for': ['javascript','html','tag','jsx'] }

Plug 'mohitleo9/vim-fidget', {
\ 'do' : {
  \   'unix' : 'sudo npm install',
  \   'mac'  : 'npm install',
  \ },
\}

Plug 'othree/html5.vim'
Plug 'othree/html5-syntax.vim'
" END JAVASCRIPT

" RUBY
Plug 'tpope/vim-rake', {'for' : 'ruby'}
Plug 'tpope/vim-cucumber', {'for' : 'ruby'}
Plug 'tpope/vim-bundler', {'for' : 'ruby'}
Plug 'vim-ruby/vim-ruby', {'for' : 'ruby'}
" END RUBY

" GOLANG
Plug 'fatih/vim-go', {'for' : 'go'}
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" END GOLANG

" SYNTAX FORCE
au BufRead,BufNewFile *.jsm setfiletype javascript
au BufRead,BufNewFile *.xul setfiletype xml
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.html set filetype=javascript
au BufRead,BufNewFile *.tag set filetype=javascript
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.adoc set filetype=asciidoc
" END SYNTAX FORCE

call plug#end()

