{ config, lib, pkgs, ... }:

{
  programs.bash = {
    completion.enable = true;
    enableLsColors = true;
    undistractMe = {
      enable = true;
      timeout = 30;
      playSound = true;
    };
  };
}
