{ config, lib, pkgs, ... }:

{
  programs.bash = {
    completion.enable = true;
    enableLsColors = true;
  };
}
