" From Quickscope
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
colorscheme material

" set background=dark

" Italic Modifiers
hi Special cterm=italic gui=italic
hi Comment cterm=italic gui=italic
hi StorageClass cterm=italic gui=italic
hi Identifier cterm=italic gui=italic
hi rubyConstant cterm=italic gui=italic
hi rubyBlockParameter cterm=italic gui=italic
hi rubyRailsUserClass cterm=italic gui=italic
hi cssURL cterm=italic gui=italic

" JS Stuff
hi jsOperator gui=italic
hi jsParensIfElse gui=bold
hi jsObjectProp gui=bold
hi javascriptFuncKeyword cterm=italic gui=italic
hi javaScriptFunction cterm=italic gui=italic

" Make Columns stand out
highlight ColorColumn term=reverse ctermbg=200 guibg=#293c43
call matchadd('ColorColumn', '\%101v', 100)
set fillchars=vert:┃,fold:━
highlight VertSplit cterm=none ctermbg=none ctermfg=247

hi LineNr ctermbg=NONE gui=NONE guifg=#7681ac guibg=NONE
hi CursorLineNr ctermbg=NONE gui=NONE guifg=#4f5e64 guibg=NONE
