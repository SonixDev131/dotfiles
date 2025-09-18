#!/bin/bash

# Ubuntu Setup Script
# Author: sonixdev131
# Description: Installs development tools, CLI utilities, clones dotfiles, and configures system

set -e

sudo apt update && sudo apt upgrade -y
# sudo apt install build-essential procps curl file git -y

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
    rustc --version
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

# Main function
main() {
  echo "🚀 Starting macOS setup..."

  # Install Homebrew first
  install_homebrew

  # Install CLI tools
  install_cli_tools

  # Clone and setup dotfiles
  # ... (your dotfiles setup code)

  # Configure fish shell
  # ... (your fish configuration)

  echo "🎉 Setup completed!"
}

# Run the script
main "$@"
