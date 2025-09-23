{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bitcoin
  ];
}