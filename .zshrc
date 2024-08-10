export GPG_TTY=$(tty)

# if [[ $(uname) == "Darwin" ]]; then
#   # echo "sourcing mac"
#   eval "$(/opt/homebrew/bin/brew shellenv)"
#   source /opt/homebrew/opt/zinit/zinit.zsh
# elif [[ $(uname) == "Linux" ]]; then
#   # echo "sourcing linux"
#   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#   source /home/linuxbrew/.linuxbrew/opt/zinit/zinit.zsh
# fi

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# snippets
zinit snippet OMZP::command-not-found
zinit ice as"completion"
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# load completions
autoload -U compinit && compinit
zinit cdreplay -q

# oh-my-posh is not compatible with Mac's default terminal
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/catppuccin_mocha.omp.json)"
fi

# Keybindings
bindkey -v

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes


# Aliases
alias lz='eza'
alias ll='lz --all --long --header'
alias d='docker'
alias g='git'
alias k='kubectl'
alias projs='cd ~/Projects'
alias tmx='tmux new -As init'

source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
