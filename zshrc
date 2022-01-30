setopt inc_append_history
setopt share_history

autoload -Uz compinit promptinit

compinit
zstyle ':completion:*' menu select

promptinit
prompt suse

