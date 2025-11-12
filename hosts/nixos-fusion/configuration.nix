{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system/common-settings.nix
    ../../modules/packages/common.nix
  ];

  environment.systemPackages = with pkgs; [
    nodejs_24
    claude-code
    stow
    neovim
  ];

  nixpkgs.config.allowUnfree = true;
}
