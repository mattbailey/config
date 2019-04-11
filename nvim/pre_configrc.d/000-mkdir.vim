if !isdirectory(expand('$HOME/.cache/nvim'))
  call mkdir(expand('$HOME/.cache/nvim'))
endif
if !isdirectory(expand('$HOME/.cache/nvim/swp'))
  call mkdir(expand('$HOME/.cache/nvim/swp'))
endif
if !isdirectory(expand('$HOME/.cache/nvim/spell'))
  call mkdir(expand('$HOME/.cache/nvim/spell'))
endif
if !isdirectory(expand('$HOME/.cache/nvim/vim_undo'))
  call mkdir(expand('$HOME/.cache/nvim/vim_undo'))
endif
if !isdirectory(expand('$HOME/.cache/nvim/sessions'))
  call mkdir(expand('$HOME/.cache/nvim/sessions'))
endif
