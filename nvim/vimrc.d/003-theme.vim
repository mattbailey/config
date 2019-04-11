colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1
set background=dark

" Italic Modifiers
hi Special cterm=italic gui=italic
hi javaScriptFunction cterm=italic gui=italic
hi Comment cterm=italic gui=italic
hi StorageClass cterm=italic gui=italic guifg=#d86e37

hi NonText ctermfg=59 cterm=NONE guifg=#525563 gui=NONE 
hi SpecialKey ctermfg=59 ctermbg=235 cterm=NONE guifg=#525563 guibg=#282a36 gui=NONE
hi javascriptFuncKeyword ctermfg=117 ctermbg=NONE cterm=italic guifg=#8be9fd guibg=NONE gui=italic
hi Identifier ctermfg=117 ctermbg=NONE cterm=italic guifg=#8be9fd guibg=NONE gui=italic
hi rubyConstant ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi rubyBlockParameter ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb86c guibg=NONE gui=italic
hi rubyRailsUserClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi cssURL ctermfg=215 ctermbg=NONE cterm=NONE guifg=#ffb86c guibg=NONE gui=italic

hi ALEError ctermbg=none cterm=underline gui=underline guibg=none

" JS Stuff
hi jsOperator guifg=#7ebff7 gui=italic
hi jsSpreadOperator guifg=#14a95b
hi jsFuncCall guifg=#a96c52
hi jsIfElseBraces guifg=#009c96
hi jsFuncBraces guifg=#007c78
hi jsObjectBraces guifg=#00e5dc
hi jsParensIfElse guifg=#e5e560 gui=bold
hi jsObjectProp gui=bold
hi jsParenIfElse guifg=#f78e9c

" Make Columns stand out
highlight ColorColumn ctermbg=200
call matchadd('ColorColumn', '\%101v', 100)
set fillchars=vert:┃,fold:━
highlight VertSplit cterm=none ctermbg=none ctermfg=247
