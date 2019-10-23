" ==================================================
" ripgrep using normal vim grep
" ==================================================

" nnoremap g/ :grep!<space>
" nnoremap g* :grep! -w <C-R><C-W><space>
" nnoremap ga :grepadd!<space>
"
" if executable("rg")
"     set grepprg=rg\ --vimgrep\ --no-heading\ -i
"     set grepformat=%f:%l:%c:%m,%f:%l:%m
" endif
"
" augroup Grep
"   autocmd!
"   " Auto open grep quickfix window
"   " autocmd QuickFixCmdPost *grep* cwindow
"   autocmd QuickFixCmdPost [^l]* cwindow
"   autocmd QuickFixCmdPost l* lwindow
" augroup END
"
" let g:rg_highlight = 1
" let g:rg_derive_root = 1
"
" fun! s:RgFloat(txt)
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')
"
"   let height = float2nr(30)
"   let width = float2nr(120)
"   let horizontal = float2nr((&columns - width) / 2)
"   let vertical = 1
"
"   let opts = {
"         \ 'relative': 'editor',
"         \ 'row': vertical,
"         \ 'col': horizontal,
"         \ 'width': width,
"         \ 'height': height,
"         \ 'style': 'minimal'
"         \ }
"
"   call nvim_open_win(buf, v:true, opts)
"   call s:RgGrepContext(function('s:RgSearch'), s:RgSearchTerm(a:txt))
" endfun
