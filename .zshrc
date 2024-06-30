# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="amuse"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

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

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# A file for all the API keys
if [ -f ~/.api_keys ]; then
  . ~/.api_keys
fi

# Editing bashrc stuff
alias bashrc='nvim ~/.bashrc'

# Editing zshrc stuff
alias zshrc='nvim ~/.zshrc'

# Activate changes
alias src='source ~/.zshrc'

alias dl='http --download'

# Git aliases
alias ga='git add .'
alias gs='git status'
alias gi='git init'
alias gp='git push'
alias gc='git commit -m'

# Aliases file listing
alias ls='eza --group-directories-first --icons'
alias ll='eza -al --group-directories-first --icons'

# Other aliases
alias logout='sudo pkill -u $USER'
alias mkdir='mkdir -p'

# Set nvim as default editor
export EDITOR="nvim"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/ifkash/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/ifkash/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
. "$HOME/.cargo/env"

# Alias for micromamba
alias mamba='micromamba'

# Just pass the name of environment to make. Example: menv ML
menv() {
  if [ -z "$1" ]; then
    echo "Please provide a name for the environment"
  else
    micromamba create -n "$1" python=3.10 -c conda-forge -y
  fi;
}

# Just pass the name of environment to delete. Example: mrenv ML
mrenv() {
  if [ -z "$1" ]; then
    micromamba env list
  else
    micromamba deactivate && micromamba env remove -n "$1" -y
  fi
}

# Just pass the name of environment to activate. Example: ac ML
ac() {
  if [ -z "$1" ]; then
    micromamba env list
  else
    micromamba activate "$1"
  fi
}

deac() {
  micromamba deactivate
}

# Alias for uv pip (https://github.com/astral-sh/uv)
alias venv='uv venv && source .venv/bin/activate'
alias denv='deactivate'
alias pip='uv pip'
alias freeze='uv pip freeze | uv pip compile - -o requirements.txt'
alias pipr='uv pip install -r requirements.txt'
alias pip-setup='uv pip compile setup.py -o requirements.txt'

# Alias for tmux with unicode support
alias tmux='tmux -u'

# Docker aliases
alias up='docker compose up --build -d'
alias down='docker compose down -v'

# Ubuntu alias
alias updrade='sudo nala update && sudo nala upgrade -y'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

export PATH="/usr/lib/ccache:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

# Java Maven
export PATH=$PATH:/home/ifkash/.maven/bin

[[ -r ~/zsh-snap/znap/znap.zsh ]] ||
  git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/ubuntu-dotfiles/zsh-snap/znap

# Start zsh-snap
source ~/zsh-snap/znap/znap.zsh

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
