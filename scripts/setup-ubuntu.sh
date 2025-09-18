#!/bin/bash

# Ubuntu Setup Script
# Author: sonixdev131
# Description: Installs development tools, CLI utilities, clones dotfiles, and configures system

set -e

# Check if running on Ubuntu
if ! grep -q "Ubuntu" /etc/os-release 2>/dev/null; then
  echo "❌ This script only supports Ubuntu"
  exit 1
fi

# Check if not running as root
if [[ $EUID -eq 0 ]]; then
  echo "❌ This script should not be run as root"
  exit 1
fi

update_system() {
  echo "📦 Updating Ubuntu system..."
  (sudo apt update && sudo apt upgrade -y) || {
    echo "❌ Failed to update system"
    return 1
  }
  echo "✅ System updated successfully"
}

# Check if Homebrew is already installed
# Install Homebrew
install_homebrew() {
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for current session
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bashrc
  else
    echo "Homebrew is already installed"
    # Update Homebrew
    brew update
  fi
}

install_rust() {
  if ! command -v rustc &>/dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo "suscessfully installed Rust"
  else
    echo "Rust is already installed"
    echo "Updating Rust..."
    rustup update
  fi
}

# Function to install packages via Homebrew
brew_install() {
  local package="$1"

  if brew list "$package" &>/dev/null; then
    echo "✅ Already installed: $package"
  else
    echo "📦 Installing: $package..."
    brew install "$package" || {
      echo "❌ Failed to install $package"
      return 1
    }
    echo "✅ Successfully installed: $package"
  fi
}

install_cli_tools() {
  echo "Installing CLI tools via Homebrew..."

  # List of packages to install
  local packages=(
    "fish"
    "git"
    "zoxide"
    "eza"
    "bat"
    "fd"
    "ripgrep"
    "lazygit"
    "btop"
    "duf"
    "atuin"
    "tldr"
    "curlie"
    "starship"
    "stow"
    "neovim"
    "tmux"
    "node"
  )

  # Install each package
  for package in "${packages[@]}"; do
    brew_install "$package"
  done

  echo "All CLI tools installed!"
}

change_shell_to_fish() {
  local fish_path
  fish_path=$(which fish)

  if [ "$SHELL" != "$fish_path" ]; then
    echo "Changing default shell to fish..."

    if ! grep -q "$fish_path" /etc/shells; then
      echo "Adding fish to /etc/shells..."
      echo "$fish_path" | sudo tee -a /etc/shells
    fi

    chsh -s "$fish_path" || {
      echo "❌ Failed to change shell to fish"
      return 1
    }

    echo "✅ Default shell changed to fish"
  else
    echo "Fish is already the default shell"
  fi
}

setup_config() {
  local dotfiles_dir="$HOME/dotfiles"

  # backup existing config files
  if [[ -d "$dotfiles_dir" ]]; then
    echo "Backing up existing dotfiles..."
    mv "$dotfiles_dir" "${dotfiles_dir}_backup_$(date +%Y%m%d%H%M%S)"
  fi

  # clone dotfiles repo
  git clone https://github.com/SonixDev131/dotfiles.git "$dotfiles_dir" || {
    echo "❌ Failed to clone dotfiles repository"
    return 1
  }

  cd "$dotfiles_dir" || {
    echo "❌ Failed to change directory to dotfiles"
    return 1
  }

  # stow specific packages
  local packages=(
    "shell"
    "git"
    "tmux"
    "dev-brain"
    "eza"
    "nvim"
  )
  for package in "${packages[@]}"; do
    if [[ -d "$package" ]]; then
      echo "Stowing $package..."
      stow -Rv "$package" || {
        echo "❌ Failed to stow $package"
        return 1
      }
    else
      echo "⚠️ Package directory $package does not exist in dotfiles"
    fi
  done
}

# Main function
main() {
  echo "🚀 Starting Ubuntu setup..."

  # confirm_installation

  update_system
  install_homebrew
  install_rust
  install_cli_tools
  setup_config
  change_shell_to_fish

  echo "🎉 Setup completed!"
  echo "Please restart your terminal to use Fish shell."
}

# Run the script
main "$@"
