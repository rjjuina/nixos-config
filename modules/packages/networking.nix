{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dig
    nmap
    netcat
    rsync
  ];
}
