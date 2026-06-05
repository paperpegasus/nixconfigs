{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang
    fastfetch
    firefox
    hugo
    logseq
    minikube
    obsidian
    wl-clipboard
  ];
}
