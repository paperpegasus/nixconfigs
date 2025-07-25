# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nix
  ];
  boot = {
    # Use the systemd-boot EFI boot loader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  # networking
  networking.hostName = "darkhorse"; # Define your hostname.
  networking.hostId = "e4ce6b52";

  # Set your time zone.
  time.timeZone = "Africa/Nairobi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  nix =
    let
      users = [
        "root"
        "paperpegasus"
      ];
    in
    {
      settings = {
        trusted-users = users;
        allowed-users = users;
        warn-dirty = false;
        sandbox = "relaxed";
        auto-optimise-store = true;
        experimental-features = "nix-command flakes";
      };
    };

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "broadcom-sta"
      "discord"
      "google-chrome"
      "vscode"
    ];

  # Define a user account. Don't forget to set a password with  passwd .
  users.users.paperpegasus = {
    # useDefaultShell = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINP/nLlQ/8DjAgM5RMmFR406DicjlXq4w+EpdnfuDIaU xriseugene@gmail.com"
    ];
    shell = pkgs.bash;
    isNormalUser = true;
    initialHashedPassword = "$6$4k7GWIhnAUu6JLZd$EQ.5184j5nGLpe1gvkCNXWI9/iwkA7veBsrwkYXIY5ZioDpjaNOZtnEi5R5GpVcsh/1YS2rabMj.7l/G9UQuy0";
    extraGroups = [ "wheel" ]; # Enable  sudo  for the user.
  };
  environment.systemPackages = with pkgs; [
    wget
    tree
    sl
    go
    awscli2
    alacritty
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
