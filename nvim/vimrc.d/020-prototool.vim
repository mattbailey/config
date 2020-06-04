
au BufEnter,BufWritePost *.proto set filetype=proto

"let g:prototool_executable = 'docker run --rm -v $(pwd):/src buffout-tools:prototool'
" let g:prototool_executable = 'docker exec prototool prototool'


" if (&ft=='proto')
"   echo "protodetected"
"   call PrototoolFormatFixEnable()
" endif

" autocmd BufEnter,BufWritePost *.proto :call PrototoolFormatFixEnable()
" autocmd BufEnter,BufWritePost *.proto :call PrototoolFormatOnSave()
" autocmd BufNewFile *.proto :call PrototoolCreateOnSave()
" autocmd BufReadPost *.proto :call PrototoolCreateReadPostOnSave()
