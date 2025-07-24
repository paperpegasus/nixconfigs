{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    ghostty
    fd
    clang
    fastfetch
  ];
}
