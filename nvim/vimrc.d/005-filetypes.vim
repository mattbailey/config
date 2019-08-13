" Go template files
augroup tmpl_ft
  au!
  autocmd BufNewFile,BufRead *.tmpl   set filetype=gotexttmpl
  autocmd BufNewFile,BufRead *.html   set filetype=gohtmltmpl
augroup END
