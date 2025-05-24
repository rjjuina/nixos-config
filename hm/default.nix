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

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      export LC_ALL="en_US.UTF-8"
      export LC_CTYPE="en_US.UTF-8"
      export LANG="en_US.UTF-8"
      unset LSCOLORS
      export CLICOLOR=1
      export CLICOLOR_FORCE=1
    '';

    # Optional: configure zsh further
    shellAliases = {
      lg = "lazygit";
      ll = "ls -l";
      la = "ls -la";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    # Optional: oh-my-zsh integration
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "fzf" ];
      theme = "robbyrussell";
    };
  };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    bat = {
      enable = true;
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
      extraOptions = [
        "--color=always"
        "--group-directories-first"
        "--header"
      ];
    };
    man = {
      enable = true;
    };
    readline = {
      enable = true;
    };
    tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };
  };
}
