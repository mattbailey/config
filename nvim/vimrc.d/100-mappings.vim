" Use ripgrep to search
"map <c-f> <esc>:Clap grep<CR>

" Use clap to search (uses ripgrep)
map <c-f> <esc>:Clap grep<CR>
nnoremap <silent> g# :Clap grep ++query=<cword> <CR>

" Open nerdtree
nmap \e :NERDTreeToggle<CR>

" Open undotree
nnoremap \u :UndotreeToggle<CR>

" Open tagbar
"nmap \g :TagbarToggle<CR>

" Open vista tags
nmap \g :Clap tags<CR>

" Open previous buffer
nmap <BS> :b#<CR>

" open files via fzf
"map <c-d> <esc>:Files<cr>

" open files via clap
map <c-d> <esc>:Clap files<cr>

" open buffers via clap
map <c-b> <esc>:Clap buffers<cr>

" complete line
imap <c-l> <plug>(fzf-complete-line)

" Wrap and unwrap arguments
nnoremap <silent> <leader>a :ArgWrap<CR>

" Colorpicker (only for mac)
"inoremap <C-C> <C-R>=system('color-picker')<CR>

" hex editor
nnoremap <leader>b :%!xxd<CR>

" set pastetoggle=<F3>
map <F3> :set paste!<CR>

"Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

" better movement
nmap j gj
nmap k gk

" Don't remember what this shit does
map cc <leader>c<space>
map  <F6> :setlocal spell! spelllang=en<CR>
map  <F12> :set invhls<CR>
cmap <C-g> <C-u><ESC>
command! -bang W w<bang>

" Buffer movements
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" visual block
nnoremap q <c-v>

" Make Ctrl-e jump to the end of the current line in the insert mode. This is
" handy when you are in the middle of a line and would like to go to its end
" without switching to the normal mode.
inoremap <C-e> <C-o>$
" map ctrl-a to beginning of line
cnoremap <C-a>  <Home>

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" Quickly select the text that was just pasted. This allows you to, e.g.,
" indent it after pasting.
noremap gV `[v`]

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Auto close popup menu when finish completion
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" for nvim-toggle-terminal
nnoremap <silent> <C-z> :call nvim_toggle_terminal#ToggleTerminal()<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:call nvim_toggle_terminal#ToggleTerminal()<Enter>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
