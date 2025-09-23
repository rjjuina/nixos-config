{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    htop
    lsof
    neofetch
  ];
}
