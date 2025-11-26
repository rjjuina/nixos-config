{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    openssh
    wget
    curl
    gnupg
    lazygit
    ripgrep
    nixfmt-rfc-style

    gcc

    lsof
    bind
    tcpdump
    traceroute
    mtr
    netcat-gnu
    nmap
  ];
}
