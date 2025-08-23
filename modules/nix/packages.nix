{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang
    fastfetch
    firefox
    logseq
    wl-clipboard
  ];
}
