{ pkgs, lib, ...}:
{
  environment.systemPackages = with pkgs; [
    ghostty
    git
    starship
    zsh
    # optional dependencies
    # coreutils # basic GNU utilities
    fd
    clang
    neofetch
  ];
}
