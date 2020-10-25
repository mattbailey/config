function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" if executable('rg')
"   let $FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden --color=never'
"   command! -bang -nargs=* Rg
"         \ call fzf#vim#grep(
"         \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case .', 1,
"         \   fzf#vim#with_preview(), <bang>0)
" endif

if executable('fd')
	let $FZF_DEFAULT_COMMAND='fd --type f --hidden --no-ignore --follow --exclude .git'
endif

let g:preview_width = float2nr(&columns * 0.7)
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_buffers_jump = 1

" let $FZF_DEFAULT_OPTS=" --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4 --preview 'if file -i {}|grep -q binary; then file -b {}; else bat --style=changes --color always --line-range :40 {}; fi' --preview-window right:" . g:preview_width
let $FZF_DEFAULT_OPTS=" --color=dark
			\ --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1
			\ --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1
			\ --layout=reverse
			\ --margin=1,4
			\ --preview='bat --style=changes --color=always --paging=never --italic-text=always --theme=TwoDark --line-range=:50 {}'
			\ --preview-window=right:50%"

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(&lines * 0.9)
  let width = float2nr(&columns * 0.95)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = float2nr((&lines - height) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
