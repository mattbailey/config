#!/usr/bin/env bash

# Where am I?
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Load package & version definitions
source ${DIR}/packages.sh

# Base settings
set -e
set -i

# What OS are we in?
OS=$(uname)

# Create src directory to keep 3rd party utilities
SRC=${HOME}/.local/src
[[ -d "${SRC}" ]] || mkdir -p ${SRC}

# Install XCode CLI utils
hash clang || xcode-select --install

# Install homebrew
hash brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install cask first
brew install brew-cask

# Install cask packages first, since some things depend on them
if [[ "$OS" == "Darwin" ]]; then
  for pkg in ${caskPkgs[@]}; do
    brew cask install ${pkg}
  done
fi

# Install all pacakges individually
if [[ "$OS" == "Darwin" ]]; then
  for pkg in ${brewPkgs[@]}; do
    brew install ${pkg}
  done
  brew update && brew upgrade
fi

# Link up dotfiles
cd ${DIR}/dotfiles
for file in *; do
  ln -Ffs $file ${HOME}/.${file}
done
cd -

# Install fzf
git -C ${SRC} https://github.com/junegunn/fzf.git \
  || git -C ${SRC}/fzf pull
[[ -f "${HOME}/fzf.zsh" ]] \
  || ${SRC}/fzf/install

# Install antigen
git -C ${SRC} clone https://github.com/zsh-users/antigen.git \
  || git -C ${SRC}/antigen pull

# Install ruby
[[ "$(rbenv global)" != "${RUBY_VERSION}" ]] \
  && rbenv install ${RUBY_VERSION} \
  && rbenv global ${RUBY_VERSION}

# Install gems
for pkg in ${gemPkgs[@]}; do
  gem install --conservative --no-document ${pkg}
done
gem update

# Install node
[[ "$(nvm current)" != "v${NODE_VERSION}" ]] \
  && nvm install v${NODE_VERSION} \
  && nvm alias default ${NODE_VERSION}

# Install termcap files
for terminfo in ${DIR}/scripts/*.terminfo; do
  tic $terminfo
done

# Fill out cache dirs
for dir in ${cacheDirs[@]}; do
  [[ -d "${HOME}/.cache/${dir}" ]] || mkdir -p ${HOME}/.cache/${dir}
done

# Set up syncthing
ln -Ffs /usr/local/opt/syncthing/homebrew.mxcl.syncthing.plist \
  ${HOME}/Library/LaunchAgents/homebrew.mxcl.syncthing.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.syncthing.plist
