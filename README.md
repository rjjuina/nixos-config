# NixOS Configuration for OrbStack

This repository contains NixOS configuration for OrbStack virtual machines.

## Structure

- `flake.nix` - Main flake configuration
- `common.nix` - Common system packages and settings
- `hm/` - Home Manager configuration
  - `default.nix` - User-specific configuration
  - `vim.nix` - Vim configuration

## Deployment

### From macOS to OrbStack VM

Use the provided deployment script to deploy configuration from your Mac to an OrbStack VM:

```bash
# Deploy to 'nixos' VM (default)
./deploy-orb.sh

# Deploy to specific VM
./deploy-orb.sh nixos
./deploy-orb.sh rmini-nixos
```

The script will:
1. Copy the configuration to the VM using rsync
2. Build and switch to the new configuration on the VM

### Manual Deployment

If you prefer to deploy manually:

```bash
# 1. Copy configuration to VM
rsync -av --exclude='.git' ./ halston@nixos@orb:/home/halston/nixos-config/

# 2. SSH into VM
ssh halston@nixos@orb

# 3. Build and switch
cd ~/nixos-config
sudo nixos-rebuild switch --flake .#nixos --impure
```

## Adding New Packages

### System-wide packages
Edit `common.nix` and add packages to `environment.systemPackages`.

### User-specific packages
Edit `hm/default.nix` and add packages to `home.packages`.

## VM Configuration

The configuration uses `/etc/nixos/configuration.nix` from the OrbStack VM for base settings, which includes:
- Network configuration
- User setup
- OrbStack-specific certificates
- Container settings

## Requirements

- OrbStack installed on macOS
- NixOS VM created in OrbStack
- SSH access to the VM (automatic with OrbStack)