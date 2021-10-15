# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Postgresql
PATH=/usr/local/pgsql/bin:$PATH
export PATH

# brew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Composer
export PATH=$HOME/.config/composer/vendor/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/cijin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cj-custom"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
source ~/.myShCommands/.makedir.sh
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# ------------------------------------------------------------------ Start Alias Section ----------------------------------------------------- #


source /home/cijin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# setting chromium (did this as I ran into problems running the paypal test)
#export CHROME_BIN=/usr/bin/chromium-browser

# alias for update and upgrade
alias apt-up='sudo apt-get update && sudo apt-get upgrade'
alias resetAudio='pulseaudio -k && sudo alsa force-reload'
alias vimrc='vi ~/.vimrc'
alias zshrc='vi ~/.zshrc'
alias gitlog='git log --graph --pretty=format:"%h - %an, %ar : %s"'
alias docker-rails='sudo docker-compose up -d && rails s'

# alias for clearing screen
alias c='clear'

# --------------------------- Start nx alias section --------------------------- #

# nx generate component
function nx-g() {
  if [[ -z "$2" ]] ; then
    echo "nx-g requires two arguments. 1.Component-Name 2.project. In that order. :)"

  else
    nx generate @nrwl/react:component --name=$1 --project=$2 --style=none --pascalCaseDirectory --pascalCaseFiles 
  fi
}

# nx generate component interactive in specific folder if needed
function nx-gi() {
  if [[ -z "$1" ]] ; then
    echo "nx-gi requires project-name as an argument"

  else
    nx g c --interactive --project=$1 --directory $2 --pascalCaseDirectory --pascalCaseFiles --style=none
  fi
}

# nx generate module
function nx-gm() {
  if [[ -z "$2" ]] ; then
    echo "nx-gm requires two arguments. 1.module-name 2.project. In that order. :)"

  else
    nx generate @nrwl/react:component --name=$1 --project=$2 --style=none
  fi
}

# nx generate stories alias
function nx-s() {
  if [[ -z "$1" ]] ; then
    echo "nx-s requires project-name as an argument."

  else
    nx generate @nrwl/react:stories --project=$1
  fi
}

# nx run storybook
# if no args are provided it rull run the shared-components by default
function nx-rs() {
  if [[ -z "$1" ]] ; then
    nx run shared-components:storybook

  else
    nx run $1:storybook
  fi
}

# --------------------------- End nx alias section --------------------------- #


# ------------------------------------------------------------------ End Alias Section ----------------------------------------------------- #

# ANDROID_HOME env variables (React Native)
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Deno
export DENO_INSTALL="/home/cijin/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Golang
export PATH=$PATH:/usr/local/go/bin


# Kitty Terminal
# prevent unknown terminal problem when ssh'ing
alias ssh="kitty +kitten ssh"
autoload -Uz compinit && compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
fpath=($fpath "/home/cijin/.zfunctions")

  # Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
