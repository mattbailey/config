let g:completion_enable_in_comment = 1
let g:completion_enable_snippet = 'UltiSnips'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Auto close popup menu when finish completion
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
