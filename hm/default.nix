{ config, pkgs, ... }:

{
  home.username = "halston";
  home.homeDirectory = "/home/halston";

  home.stateVersion = "25.05";


  # User-specific packages
  home.packages = with pkgs; [
    # Add user-specific packages here
    fzf
    tmux
    jq
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  imports = [
    ./vim.nix
  ];

  programs.git = {
    enable = true;
    userName = "halston";
    userEmail = "haslton@nixos.orbstack";
  };
}
