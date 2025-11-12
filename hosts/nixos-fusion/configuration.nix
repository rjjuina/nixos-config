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
