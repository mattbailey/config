" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

"The option g:qs_lazy_highlight can be used to change the vanilla highlight mode autocmd event from CursorMoved to CursorHold. This option is provided to reduce the slowdown caused by vanilla highlight mode in large terminals.
let g:qs_lazy_highlight = 1

