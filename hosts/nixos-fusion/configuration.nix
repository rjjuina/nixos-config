{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ../../modules/system/common-settings.nix
    ../../modules/packages/common.nix
  ];

  # Enable X11 and GNOME
  networking.networkmanager.enable = true;
  # networking.interfaces.ens160.useDHCP = true;

  # Force use of reliable public DNS servers
  networking.nameservers = [
    "8.8.8.8"
    "1.1.1.1"
    "8.8.4.4"
  ];

  # Prevent NetworkManager from overwriting DNS settings
  networking.networkmanager.dns = "none";

  services.xserver.enable = true;
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nodejs_24
    claude-code
    stow
    neovim
    openssl

    # Development packages for GTK4/Rust
    gtk4
    libadwaita
    pkg-config
    gcc
    rustup
  ];

  nixpkgs.config.allowUnfree = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      glib
      openssl
      libsecret
      curl
    ];
  };

}
