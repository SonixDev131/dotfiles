## 🚀 Quick Installation

### Ubuntu

````bash
curl -o- https://raw.githubusercontent.com/SonixDev131/dotfiles/main/setup.sh | bash

## 📦 Contents

- **Shell**: `.zshrc`
- **Git**: `.gitconfig`
- **Editor**: Neovim (`~/.config/nvim/`), Cursor settings
- **Terminal**: `.tmux.conf`, `ghostty`
- **Other**: `.ssh/config`, `.config/` for various apps

## 🛠️ Setup

### Prerequisites

- **GNU Stow** (install via package manager):

  ```sh
  # Debian/Ubuntu
  sudo apt install stow

  # macOS (Homebrew)
  brew install stow
````

### 🚀 Installation

1. Clone this repo into `~/dotfiles`:

   ```sh
   git clone https://github.com/sonixdev131/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Symlink configurations (run from inside `~/dotfiles`):

   ```sh
   # Symlink everything (or list specific folders like `bash git nvim`):
   stow -v */  # All directories
   ```

   - Use `-n` for a dry run (no changes): `stow -nv */`

### 🔄 Updating

- After modifying files, restow to update symlinks:

  ```sh
  stow -Rv bash  # Re-links `bash/` files
  ```

## 📂 Directory Structure

```
dotfiles/
├── bash/               # Bash configs
│   ├── .bashrc
│   └── .bash_profile
├── git/                # Git configs
│   ├── .gitconfig
│   └── .gitignore_global
├── nvim/               # Neovim config
│   └── .config/
│       └── nvim/
│           └── init.vim
└── README.md
```

## ❗ Troubleshooting

- **"File already exists" errors**: Backup and remove conflicting files first:

  ```sh
  mv ~/.bashrc ~/.bashrc.bak
  stow bash
  ```

- **Debugging**: Use `stow -v` for verbose output or `-nv` for dry runs.

## 🔗 Recommended Workflow

1. Edit files in `~/dotfiles/` (e.g., `vim ~/dotfiles/nvim/.config/nvim/init.vim`).
2. Restow to apply changes:

   ```sh
   stow -Rv nvim
   ```

## 📜 License

MIT
