# Versions to install
RUBY_VERSION=2.2.0
NODE_VERSION=0.11.14

# cask packages
caskPkgs=(
  'clamxav'
  'dropbox'
  'firefox'
  'flash'
  'google-chrome'
  'mailbox'
  'steam'
  'transmission'
  'xquartz'
  'iterm2'
  'hipchat'
  'java'
  'vlc'
  'handbrake'
  'vagrant'
)

# Homebrew packages
brewPkgs=(
  'zsh'
  'zsh-completions'
  'zsh-syntax-highlighting'
  'gh'
  'curl --with-c-ares --with-gssapi --with-libidn --with-libmetalink --with-libssh2 --with-rtmpdump --with-libmetalink'
  'vim --HEAD --with-lua --with-luajit --override-system-vi --disable-nls --with-tcl'
  'git --with-blk-sha1 --with-gettext --with-pcre --with-persistent-https'
  'vimpager'
  'jq'
  'pass'
  'lastpass-cli'
  'go'
  'imagemagick'
  'gifsicle'
  'ack'
  'the_silver_searcher'
  'watch'
  'tmux'
  'brew-cask'
  'redis'
  'elasticsearch'
  'etcdctl'
  'fleetctl'
  'boot2docker'
  'rbenv'
  'rbenv-gem-rehash'
  'ruby-build'
  'aria2'
  'coreutils'
  'iperf'
  'p4'
  'mtr'
  'resty'
  'mongo --with-openssl'
)

# dirs in .cache to create
cacheDirs=(
 'vim'
 'vimfiler'
 'vimundo'
 'zhistory'
)
