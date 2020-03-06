
set -x PATH $HOME/.config/scripts $PATH
set -x PATH $HOME/go/bin $PATH
set -x PATH /usr/local/opt/go/libexec/bin $PATH

# set -xting EDITOR
if type -q vi
  set -x EDITOR vi
end
if type -q vim
  set -x EDITOR vim
end
if type -q nvim
  set -x EDITOR nvim
  alias vim nvim
end

# Go
set -x GOPATH $HOME/go
set -x CGO_ENABLED 0
set -x GO111MODULE on
set -x GOPRIVATE github.com/BethesdaNet

# bat, cat replacement
# https://github.com/eth-p/bat-extras
if type -q bat
  alias cat bat
  set -x PAGER bat
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
set -x GHQ_ROOT $HOME/src

# History sync
function sync_history --on-event fish_preexec
  history --save
  history --merge
end

# Package management
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

starship init fish | source
