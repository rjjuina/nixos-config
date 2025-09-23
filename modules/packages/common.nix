{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    openssh
    wget
    curl
    gnupg
    lazygit
    ripgrep
  ];
}
