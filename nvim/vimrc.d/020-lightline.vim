
let g:indicator_checking = " \uf110"
let g:indicator_warnings = " \uf071"
let g:indicator_errors = " \uf05e"
let g:indicator_ok = " \uf00c"
let g:indicator_info = ' 🛈 '
let g:indicator_hint = '❗'
let g:spinner_frames = ['⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷']

let g:lightline = {
			\ 'colorscheme': 'material_vim',
			\ 'mode_map': {
			\ 'n' : 'N',
			\ 'i' : 'I',
			\ 'R' : 'R',
			\ 'v' : 'V',
			\ 'V' : 'VL',
			\ "\<C-v>": 'VB',
			\ 'c' : 'C',
			\ 's' : 'S',
			\ 'S' : 'SL',
			\ "\<C-s>": 'SB',
			\ 't': 'T',
			\ },
			\ 'active': {
			\   'left': [
			\     [ 'mode', 'paste' ],
			\     [ 'gitbranch', 'diagnostic', 'filename', 'method', 'status' ]
			\   ],
			\ },
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead',
			\   'fileformat': 'LightlineFileformat',
			\   'filetype': 'LightlineFiletype',
			\   'filename': 'LightlineFilename',
			\   'method': 'NearestMethodOrFunction',
			\   'status': 'LSPStatus',
			\ },
			\ }

let g:lightline.separator = {
			\   'left': '', 'right': ''
			\}
let g:lightline.subseparator = {
			\   'left': '', 'right': ''
			\}

let g:lightline.tabline = {
			\   'left': [ ['tabs'] ],
			\   'right': [ ['close'] ]
			\ }

" For narrow windows
function! LightlineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

" For narrow windows
function! LightlineFiletype()
	return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" Combine filename and modified
function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let modified = &modified ? ' +' : ''
	return filename . modified
endfunction

function! LSPStatus() abort
  return luaeval("require('statusline').lsp()")
endfunction
