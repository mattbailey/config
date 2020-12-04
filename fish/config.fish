set -x LANG en_US.UTF-8

set -x PATH $HOME/.config/scripts $PATH
set -x PATH $HOME/go/bin $PATH
set -x PATH /usr/local/opt/go/libexec/bin $PATH
set -x PATH /usr/local/opt/make/libexec/gnubin $PATH
set -x PATH ./.bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH (ruby -r rubygems -e 'puts Gem.user_dir')/bin $PATH
set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH

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
else
  echo missing: neovim
end

# Go
set -x GOPATH $HOME/go
set -x CGO_ENABLED 0
set -x GO111MODULE on
set -x GOPRIVATE github.com/BethesdaNet

# ripgrep global config
set -x RIPGREP_CONFIG_PATH $HOME/.config/ripgrep

# FZF optimizations
if type -q fzf
  if type -q fd
    set -x FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
    set -x FZF_CTRL_T_COMMAND "command $FZF_DEFAULT_COMMAND \$dir 2> /dev/null | sed '1d; s#^\./##'"
  else
    echo missing: fd
  end
else
  echo missing: fzf
end

# bat, cat replacement
# https://github.com/eth-p/bat-extras
if type -q bat
  alias cat bat
  set -x FZF_CTRL_T_OPTS "--color=dark \
  --preview='bat --style=changes --color=always --paging=never --italic-text=always --theme=TwoDark --line-range=:100 {}' \
  --preview-window=right:50%"
else
  echo missing: bat
end
if type -q batgrep
  alias rg batgrep
end
if type -q batman
  alias man batman
end
# if type -q batwatch
#   alias watch batwatch
# end

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

# pip3 install neovim-remote
# https://github.com/caenrique/nvim-toggle-terminal
# if type -q nvr
#   set -x NVIM_LISTEN_ADDRESS /tmp/nvimsocket
#   function nvim_wrapper
#     if not set -q NVIM_LISTEN_ADDRESS
#       nvim $argv
#     else
#       if set -q argv
#         nvr -s -l $argv
#       else
#         nvr -s -l -c new
#       end
#     end
#   end
#   alias vim nvim_wrapper
#   alias nvim nvim_wrapper
# end

# Load shell secrets from secure source
if test -f $HOME/.private/fish/secrets.fish
  source $HOME/.private/fish/secrets.fish
end

# starship init fish | source
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/opt/curl/bin" $fish_user_paths

# spacefish shell stuff https://github.com/matchai/spacefish/blob/master/docs/Options.md
#   all this language detection is very slow
set SPACEFISH_PACKAGE_SHOW false
set SPACEFISH_NODE_SHOW false
set SPACEFISH_JULIA_SHOW false
set SPACEFISH_DOCKER_SHOW false
set SPACEFISH_RUBY_SHOW false
set SPACEFISH_HASKELL_SHOW false
set SPACEFISH_AWS_SHOW false
set SPACEFISH_VENV_SHOW false
set SPACEFISH_CONDA_SHOW false
set SPACEFISH_ELIXIR_SHOW false
set SPACEFISH_PYENV_SHOW false
set SPACEFISH_GOLANG_SHOW false
set SPACEFISH_PHP_SHOW false
set SPACEFISH_RUST_SHOW false
set SPACEFISH_DOTNET_SHOW false
set SPACEFISH_KUBECONTEXT_SHOW false
# Other options
set SPACEFISH_EXIT_CODE_SHOW true

