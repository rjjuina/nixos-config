{ config, pkgs, ... }:

{
  # Common system packages
  environment.systemPackages = with pkgs; [
    # Text editors
    vim
    
    # Development tools
    gnupg
    curl
    wget
    
    # System utilities
    htop
    tree
    unzip
    zip
    rsync
    
    # Network tools
    dig
    nmap
    netcat
    
    # File management
    fd
    ripgrep
    bat
    
    # System monitoring
    neofetch
    lsof
  ];

  # Enable flakes system-wide
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Auto garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Optimize nix store
  nix.settings.auto-optimise-store = true;

  
  # Internationalization
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "C.UTF-8/UTF-8"
    ];
  };

  environment.variables = {
    EDITOR = "vim";
  };

  programs.zsh.enable = true;
}
