# vimpager
which vimpager 2> /dev/null && export PAGER=$(which vimpager)

# Default Editor
export EDITOR=vim

# Docker
export DOCKER_HOST='tcp://127.0.0.1:4243'

# Iterm integration if present
[[ -f ${HOME}/.iterm2_shell_integration.zsh ]] && source ${HOME}/.iterm2_shell_integration.zsh
