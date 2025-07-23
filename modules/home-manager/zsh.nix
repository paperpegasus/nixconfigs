{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      update = "sudo nixos-rebuild switch";
    };
    history.size = 10000;
  };
  home.packages = [ pkgs.hello ];
}
