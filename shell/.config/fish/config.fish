# Fish Shell Configuration
# ======================
set -g fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

# Environment setup (login shells)
# Path additions
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.config/herd-lite/bin
fish_add_path -g $HOME/.config/tmux/plugins/tmux-session-wizard/bin

# Rust environment
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

# Global environment variables
set -gx EDITOR nvim
set -gx PHP_INI_SCAN_DIR "$HOME/.config/herd-lite/bin"

# NAVIGATION
starship init fish | source
alias ls='eza --classify=auto --color --group-directories-first --sort=extension -A --icons'
alias lla='eza --classify=auto --color --group-directories-first --sort=extension -a -l --octal-permissions --icons --git'
alias lt='eza --tree --level=2 --group-directories-first --icons'
alias find="fd" # Replace find with fd
alias cat="bat" # Replace cat with bat
alias grep="rg" # Replace grep with rg

# MONITORING
alias top="btop" # Use btop instead of top
alias df="duf" # Use duf instead of df
alias dig="dog" # Use dog instead of dig

# GIT
alias g="lazygit" # Quick access to lazygit

# FUZZY FINDING (requires fzf)
# Fuzzy find file and open in $EDITOR
function fe
    set -l file (fzf --height=40% --preview='bat --color=always --style=numbers {}' --preview-window=right:60%:wrap)
    if test -n "$file"
        $EDITOR "$file"
    end
end

alias v='nvim'
alias vim='nvim'
alias vc='nvim $HOME/.config/nvim'
alias vf='nvim $HOME/.config/fish/config.fish'
alias sf='source $HOME/.config/fish/config.fish'
alias grep='grep --color=auto'


# Additional interactive features can go here
# - Custom functions  
# - Key bindings
# - Completion settings

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# For macOS with Homebrew on Apple Silicon
# eval "$(/opt/homebrew/bin/brew shellenv)"
