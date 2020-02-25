
set PATH $HOME/.config/scripts $PATH
set PATH $HOME/go/bin $PATH
set PATH /usr/local/opt/go/libexec/bin $PATH

# Setting EDITOR
if type -q vi
  set EDITOR vi
end
if type -q vim
  set EDITOR vim
end
if type -q nvim
  set EDITOR nvim
  alias vim nvim
end

# Go
set GOPATH $HOME/go
set CGO_ENABLED 0
set GO111MODULE on

# bat, cat replacement
# https://github.com/eth-p/bat-extras
if type -q bat
  alias cat bat
  set PAGER bat
end
if type -q batgrep
  alias rg batgrep
end
if type -q batman
  alias man batman
end
if type -q batwatch
  alias watch batwatch
end

# GHQ repo manager
set GHQ_ROOT $HOME/src

starship init fish | source
