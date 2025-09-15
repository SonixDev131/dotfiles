# Fish Shell Configuration
# ======================
set -g fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

# Environment setup (login shells)
# Path additions
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.config/herd-lite/bin
fish_add_path $HOME/.config/tmux/plugins/tmux-session-wizard/bin

# Rust environment
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

# Global environment variables
set -gx EDITOR nvim
set -gx PHP_INI_SCAN_DIR "$HOME/.config/herd-lite/bin"

# Interactive shell setup
# Aliases
alias v='nvim'
alias vim='nvim'
alias vc='nvim $HOME/.config/nvim'
alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'

# Prompt initialization
if command --query starship
    starship init fish | source
end

# Additional interactive features can go here
# - Custom functions  
# - Key bindings
# - Completion settings
