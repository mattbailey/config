
" We want to use neovim's built in LSP now.
"   NOTE: this disables a lot of vim-go functionality, but the built-in LSP
"   implementation is much faster.
"
"   All this stuff confliects with how we want to use neovim-lsp
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

let g:go_async_run = 1
let g:go_fmt_command = 'gofmt'
let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_fmt_options = {
			\ 'gofmt': '-s',
			\ }
let g:go_list_type = 'quickfix'
let g:go_metalinter_command='golangci-lint run --fix'
let g:go_metalinter_autosave = 0
let g:go_list_height = 8
" do not create an Hello World template
let g:go_template_autocreate = 0

" use neovim's terminal for test runs, etc...
let g:go_term_enabled = 1

" show errors
let g:go_fmt_fail_silently = 0
let g:go_jump_to_error = 0

" enable vim-go text object
let g:go_textobj_enabled = 1
" text object for functions also include the comments when using 'af'
let g:go_textobj_include_function_doc = 1
" Consider the variable of an function assignment to be part of the anonymous
" function when using the `af` text object
let g:go_textobj_include_variable = 1

" syntax-highlighting for Functions, Methods and Structs
let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_debug = 1
let g:go_highlight_function_parameters = 1

" look for gopath
let g:go_autodetect_gopath = 1

" show type info
"let g:go_auto_type_info = 1


" display the variable type under the cursor
"let g:go_auto_type_info = 1
"let g:go_info_mode = 'gopls'
"let g:go_def_mode = 'gopls'

" Specifies whether `gocode` should add built-in types, functions and constants
" to an autocompletion proposals.
let g:go_gocode_propose_builtins = 0
" use binary packages for propose things
let g:go_gocode_propose_source = 0
" allow to have propose from un imported packages
let g:go_gocode_unimported_packages = 0

let g:go_snippet_engine = "automatic"

let g:go_decls_includes = 'func,type,var,const'

let g:go_auto_sameids=1

" do not resue buffer on GoDef
let g:go_def_reuse_buffer=0

" open alternate in split rather on same buffer
let g:go_alternate_mode = "split"

" create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ':put! z'
  execute ':norm I// \<Esc>$'
endfunction

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup Golang
  au FileType go nmap <leader>godoc :<C-u>call <SID>create_go_doc_comment()<CR>

  " Show a list of interfaces which is implemented by the type under your cursor
  au FileType go nmap <Leader>gos <Plug>(go-implements)

  " Show type info for the word under your cursor
  au FileType go nmap <Leader>goi <Plug>(go-info)

  " Open the relevant Godoc for the word under the cursor
  au FileType go nmap <Leader>goh <Plug>(go-doc)
  au FileType go nmap <Leader>gov <Plug>(go-doc-vertical)

  " Open the Godoc in browser
  au FileType go nmap <Leader>gobd <Plug>(go-doc-browser)

  " Alternate between test and file
  au FileType go nnoremap <Leader>goa :GoAlternate<cr>

  au FileType go nnoremap <Leader>got :GoAddTags<cr>
  au FileType go vnoremap <Leader>got :GoAddTags<cr>
  au FileType go onoremap <Leader>got :GoAddTags<cr>
  au FileType go cnoremap <Leader>got :GoAddTags<cr>
  au FileType go nnoremap <Leader>goT :GoAddTags
  au FileType go vnoremap <Leader>goT :GoAddTags
  au FileType go cnoremap <Leader>goT :GoAddTags
  au FileType go onoremap <Leader>goT :GoAddTags

  au FileType go nmap <Leader>gov <Plug>(go-def-vertical)
  au FileType go nmap <Leader>gd <Plug>(go-def-split)

  au FileType go nmap <Leader>gol <Plug>(go-metalinter)

  au FileType go nmap <leader>gob :<C-u>call <SID>build_go_files()<CR>
  au FileType go nmap <leader>got  <Plug>(go-test)
  au FileType go nmap <leader>gor  <Plug>(go-run)
  au FileType go nmap <leader>goe  <Plug>(go-install)
  au FileType go nmap <leader>goc <Plug>(go-coverage)

  " Run all possible linters from go
  au FileType go nnoremap <leader>go<c-l> :GoMetaLinter!<CR>

  au FileType go nnoremap <leader>gofs :GoFillStruct<CR>
  au FileType go nnoremap <leader>gofi :GoIfErr<CR>

  "au BufWritePost *go :GoMetaLinter!
augroup END
