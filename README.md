# 🚀 SonixDev131's Dotfiles

> Modern development environment setup for **Ubuntu** and **macOS**

A comprehensive dotfiles collection featuring modern CLI tools, elegant configurations, and automated setup scripts for a productive development workflow.

## ✨ Features

- 🔄 **Universal Setup**: Single script works on both Ubuntu and macOS
- 🛠️ **Modern CLI Tools**: Latest tools like `eza`, `bat`, `fd`, `ripgrep`, `starship`, and more
- 🐠 **Fish Shell**: Beautiful, smart terminal with great defaults
- 📦 **Package Management**: Homebrew for consistent package installation
- ⚡ **Fast Development**: Pre-configured Neovim, tmux, and git workflows
- 🎨 **Beautiful Interface**: Starship prompt with custom themes
- 🔍 **Smart Navigation**: Zoxide for intelligent directory jumping

## 🚀 Quick Installation

**One-liner installation** (works on Ubuntu and macOS):

```bash
curl -fsSL https://raw.githubusercontent.com/SonixDev131/dotfiles/main/setup.sh | bash
```

Or **manual installation**:

```bash
git clone https://github.com/SonixDev131/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

### 🔧 Installation Options

```bash
# Show help
./setup.sh --help

# Dry run (see what would be installed)
./setup.sh --dry-run

# Regular installation
./setup.sh
```

## 📦 What Gets Installed

### 🏠 Package Manager

- **Homebrew**: The missing package manager for macOS/Linux

### 🦀 Programming Languages

- **Rust**: Modern systems programming language with Cargo

### 🛠️ CLI Tools

| Tool       | Description                        |
| ---------- | ---------------------------------- |
| `git`      | Version control system             |
| `fish`     | User-friendly command line shell   |
| `starship` | Cross-shell prompt                 |
| `eza`      | Modern replacement for ls          |
| `bat`      | Cat clone with syntax highlighting |
| `fd`       | Simple, fast alternative to find   |
| `ripgrep`  | Fast text search tool              |
| `zoxide`   | Smarter cd command                 |
| `fzf`      | Command-line fuzzy finder          |
| `lazygit`  | Simple terminal UI for git         |
| `btop`     | Resource monitor                   |
| `tmux`     | Terminal multiplexer               |
| `stow`     | Symlink farm manager               |
| `atuin`    | Shell history replacement          |
| `tldr`     | Simplified man pages               |
| `curlie`   | Better curl interface              |
| `bob`      | Neovim version manager             |
| `duf`      | Better df alternative              |

### ⚙️ Configurations

- **Shell**: Fish with custom functions and aliases
- **Git**: Global gitconfig with useful aliases
- **Neovim**: Modern text editor configuration
- **Tmux**: Terminal multiplexer settings
- **Starship**: Beautiful cross-shell prompt
- **Development Brain**: Personal notes and scripts

## 📂 Directory Structure

```
dotfiles/
├── setup.sh                    # Universal setup script
├── shell/                      # Fish shell configuration
│   └── .config/fish/
├── git/                        # Git configuration
│   └── .gitconfig
├── nvim/                       # Neovim configuration
│   └── .config/nvim/
├── tmux/                       # Tmux configuration
│   └── .config/tmux/
├── starship/                   # Starship prompt config
│   └── .config/starship.toml
├── eza/                        # Eza (ls replacement) config
│   └── .config/eza/
├── dev-brain/                  # Personal development notes
└── scripts/                    # Utility scripts
```

## 🔄 Manual Configuration (Advanced)

If you prefer manual setup or want to understand the process:

### Prerequisites

```bash
# Install Homebrew first
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Stow
brew install stow
```

### Manual Stowing

```bash
cd ~/dotfiles

# Stow individual packages
stow shell      # Fish shell config
stow git        # Git configuration
stow nvim       # Neovim setup
stow tmux       # Tmux configuration
stow starship   # Starship prompt
stow eza        # Eza configuration

# Or stow everything at once
stow */
```

## 🛠️ Customization

### Adding New Configurations

1. Create a new directory for your tool: `mkdir mytool`
2. Add your config files: `mytool/.config/mytool/config.yml`
3. Stow the new package: `stow mytool`
4. Add to the setup script's package list

## 🌟 Key Features

### Fish Shell Enhancements

- **Smart autocompletion**: Context-aware suggestions
- **Syntax highlighting**: Real-time command validation
- **Custom functions**: Productivity shortcuts
- **Vi mode**: Vim-like editing in terminal

### Starship Prompt

- **Git integration**: Branch status and changes
- **Language detection**: Shows current programming language
- **Performance indicators**: Fast and informative
- **Custom themes**: Personalized appearance

### Development Workflow

- **Modern alternatives**: Drop-in replacements for classic Unix tools
- **Enhanced searching**: Fast file and content discovery
- **Efficient navigation**: Quick directory jumping with zoxide
- **Git workflow**: Lazygit for visual git operations

### Verification

Check if everything is working:

```bash
# Check fish shell
fish --version

# Check modern tools
eza --version
bat --version
fd --version
rg --version
```

## 🚀 Getting Started After Installation

1. **Restart your terminal** to use Fish shell
2. **Explore new commands**:

   ```bash
   # Use eza instead of ls
   eza -la

   # Use bat instead of cat
   bat README.md

   # Use fd instead of find
   fd "*.md"

   # Use rg instead of grep
   rg "function"
   ```

3. **Try the enhanced git workflow**:
   ```bash
   # Use lazygit for visual git operations
   lazygit
   ```

## 🔄 Updating

To update your dotfiles:

```bash
cd ~/dotfiles
git pull origin main
./setup.sh  # Re-run setup if needed
```

## 💻 Supported Systems

- ✅ **Ubuntu 20.04+**
- ✅ **macOS 11.0+ (Big Sur and later)**
- ✅ **Apple Silicon** and **Intel Macs**

## 🤝 Contributing

Feel free to fork this repository and customize it for your needs! If you find improvements or fixes, pull requests are welcome.

## 📄 License

MIT License - feel free to use and modify as needed.

---

<div align="center">

**Happy coding!** 🎉

Made with ❤️ by [SonixDev131](https://github.com/SonixDev131)

</div>
