{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang
    fastfetch
    wl-clipboard
  ];
}
