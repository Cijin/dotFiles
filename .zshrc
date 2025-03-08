export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gozilla"

plugins=(git git-prompt aliases vi-mode)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

# fzf keybindings for ctrl-r
bindkey '^R' fzf-history-widget

# go!
export PATH=$PATH:/usr/local/go/bin
# running go install <pkg>
export PATH=$PATH:$HOME/go/bin

# zig!
export PATH=$PATH:/usr/local/zig

#fzf
export PATH=$PATH:/usr/bin/fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh

# nvim alias
alias vi="~/./nvim.appimage"
alias nvim="~/./nvim.appimage"

alias tracer="~/./codetracer.appimage"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FLYCTL_INSTALL="/home/seagin/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"


# Turso
export PATH="$PATH:/home/seagin/.turso"
