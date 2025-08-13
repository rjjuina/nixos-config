{ config, pkgs, ... }:

{
  # Common system packages
  environment.systemPackages = with pkgs; [
    # Text editors
    vim

    lazygit
    
    # Development tools
    python3  # Python 3 with pip included
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
    
    # System monitoring
    neofetch
    lsof

    # blockchain
    bitcoin
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
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  environment.variables = {
    EDITOR = "vim";
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
