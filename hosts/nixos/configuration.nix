{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system/common-settings.nix
    ../../modules/packages/common.nix
    ../../modules/packages/development.nix
    ../../modules/packages/monitoring.nix
    ../../modules/packages/networking.nix
    ../../modules/packages/archiving.nix
  ];

  environment.systemPackages = with pkgs; [
  ];
}