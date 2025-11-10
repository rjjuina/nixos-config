# Stow Package Management

This directory contains configurations managed by [GNU Stow](https://www.gnu.org/software/stow/) for easy symlink management of dotfiles.

## Structure

```
stow/
├── nvim/          # Neovim configuration  
│   └── .config/
│       └── nvim/  # LazyVim setup with custom configs
└── README.md      # This file
```

## Manual Setup Requirements

### Font Requirements
The terminal configurations reference **SauceCodePro Nerd Font**:
```bash
brew install --cask font-sauce-code-pro-nerd-font
```

## NOTE: Emacs Configuration

**Emacs is NOT managed with stow** even though it would typically be a good candidate. The reason is that Emacs generates many files and directories at runtime (elpaca/, elpa/, auto-save-list/, etc.) that would end up in the dotfiles repository when using stow's default directory symlinking behavior.

While we could use `.gitignore` to exclude these files, it creates maintenance overhead and pollutes the repository structure. Instead, Emacs config files (config.org, config.el, init.el, early-init.el) are managed separately with individual symlinks via `setup-emacs.sh`.

This approach ensures:
- Only the actual config files are tracked in git
- Auto-generated files stay in `~/.config/emacs/` where they belong
- No need to maintain complex `.gitignore` patterns for Emacs
- Clean repository structure without runtime artifacts

## Usage

All commands should be run from the `stow/` directory:

```bash
cd stow
```

### Deploy Packages
```bash
stow --target=$HOME nvim
```

### Remove Packages
```bash
stow --target=$HOME --delete vim       # Remove vim package
stow --target=$HOME --delete starship  # Remove starship package
```

### Restow (Update Existing Links)
```bash
stow --target=$HOME --restow vim nvim  # Update existing symlinks
```

## Why Stow for These Configs?

**Stow is used for:**
- ✅ Editor configurations (vim/neovim) that change frequently
- ✅ Configs with many files and complex structures
- ✅ Personal preferences that don't need system integration
- ✅ Quick iteration without rebuilding Nix

**Nix Home Manager is used for:**
- ✅ System packages and services
- ✅ Shell configurations (zsh, aliases, env vars)
- ✅ CLI tools (git, direnv, fzf, etc.)
- ✅ Cross-platform compatibility

## Adding New Packages

1. Create a new directory under `stow/`
2. Add your dotfiles with proper directory structure
3. Update the `PACKAGES` array in `scripts/deploy-stow.sh`
4. Deploy with `./scripts/deploy-stow.sh`

Example:
```bash
mkdir stow/git
echo "# Custom git config" > stow/git/.gitconfig-local
./scripts/deploy-stow.sh deploy git
```

## Troubleshooting

**Conflicts with existing files:**
```bash
# Remove existing files or backup first
mv ~/.vimrc ~/.vimrc.backup
./scripts/deploy-stow.sh deploy vim
```

**Check what stow would do:**
```bash
cd stow
stow --target=$HOME --simulate vim  # Dry run
```

**Force restow (recreate symlinks):**
```bash
./scripts/deploy-stow.sh deploy  # Uses --restow internally
```
