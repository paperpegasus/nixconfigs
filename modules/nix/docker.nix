# Setting Docker up to run as a none root service.
{
  config,
  lib,
  pkgs,
  ...
}:

{
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}
