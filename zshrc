setopt inc_append_history
setopt share_history

autoload -Uz compinit; compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' menu select

autoload -Uz promptinit; promptinit; prompt suse

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

