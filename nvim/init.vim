" Partly, from https://github.com/ik5/dotvim

lua require 'tagfunc_nvim_lsp'
set tagfunc=v:lua.tagfunc_nvim_lsp

" Auto install vim plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "Installing Plug"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==================================================
" actions to be done prior for configuration
" ==================================================
for f in split(glob('~/.config/nvim/pre_configrc.d/*.vim'), '\n')
  exec 'source' f
endfor

" ==================================================
" Source the files ~/.vim/vimrc.d/
" ==================================================
for f in split(glob('~/.config/nvim/vimrc.d/*.vim'), '\n')
  exe 'source' f
endfor

" ==================================================
" actions to be done after configuration
" ==================================================
for f in split(glob('~/.config/nvim/post_configrc.d/*.vim'), '\n')
  exe 'source' f
endfor
