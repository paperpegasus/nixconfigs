{ pkgs, lib, ...}:
{
  environment.systemPackages = with pkgs; [
    ghostty
    starship
    # optional dependencies
    # coreutils # basic GNU utilities
    fd
    clang
    neofetch
  ];
}
