# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Zinit performance optimizations
declare -A ZINIT
ZINIT[COMPINIT_OPTS]=-C  # Speed up compinit with -C flag
ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]=1  # Skip disk checks for better performance

# Load starship theme
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Load programs using modern 'for' syntax
zinit as"program" from"gh-r" for \
    junegunn/fzf \
    jesseduffield/lazygit

# Load plugins with proper ordering
zinit for \
    light-mode \
  zsh-users/zsh-autosuggestions \
    light-mode \
    atload"_zsh_highlight_bind_widgets" \
  zsh-users/zsh-syntax-highlighting \
    light-mode \
    blockf \
    atload"zicompinit; zicdreplay" \
  zsh-users/zsh-completions \
    light-mode \
  Aloxaf/fzf-tab \
    light-mode \
    depth=1 \
  jeffreytse/zsh-vi-mode


# Load OMZ snippets
zinit for \
    OMZL::git.zsh \
    OMZP::git \
    OMZP::sudo \
    OMZP::aws \
    OMZP::kubectl \
    OMZP::kubectx \
    OMZP::command-not-found \
    OMZP::docker \
    OMZP::docker-compose

# Completions are now handled by zicompinit/zicdreplay in the plugins section above
# This provides better integration and performance

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey -s ^f "~/dotfiles/scripts/tmux-sessionizer\n"

# History
HISTSIZE=5000
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

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias lzd='lazydocker'
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias nvc="nvim $HOME/.config/nvim"

# Environment variables and PATH setup (consolidated and optimized)
export NVM_DIR="$HOME/.nvm"
# PHP configuration
export PHP_INI_SCAN_DIR="/home/sonixdev131/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# PATH exports (consolidated to avoid duplicates)
typeset -U path  # Ensure unique PATH entries
path=(
  "$HOME/.local/bin"
  "$HOME/.config/herd-lite/bin"
  $path
)


# Load NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Load Cargo environment
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Shell integrations
zinit for \
    OMZP::fzf

# Initialize shell integrations
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
