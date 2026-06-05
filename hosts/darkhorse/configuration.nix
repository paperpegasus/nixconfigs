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
    zfs.forceImportRoot = false;
  };

  # networking
  networking = {
    interfaces.eno1.useDHCP = true; # overrides default in useDHCP unless null
    interfaces.wlp0s20f0u10.useDHCP = true;
    networkmanager = {
      enable = true; # add user to group
      dns = "none"; # dnsmasq, default::, systemd-resolved
      wifi = {
        powersave = true; # TODO see if has issues?
        # backend = "wpa_supplicant"; # wpa_supplicant::, iwd
      };
      logLevel = "WARN"; # "OFF", "ERR", "WARN"::, "INFO", "DEBUG", "TRACE"
    };
    hostName = "darkhorse"; # Define your hostname.
    hostId = "e4ce6b52";
  };

  # Set your time zone.
  time.timeZone = "Africa/Nairobi";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

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
      "broadcom-sta-6.30.223.271-59-6.12.58"
      "obsidian"
      "nvidia-x11"
      "nvidia-settings"
      "broadcom-sta"
      "discord"
      "google-chrome"
      "vscode"
      "nvidia-kernel-modules"
    ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
    "broadcom-sta-6.30.223.271-59-6.18.34"
    "broadcom-sta-6.30.223.271-59-6.12.63"

  ];

  # Define a user account. Don't forget to set a password with  passwd .
  users.users.paperpegasus = {
    # useDefaultShell = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILPpL9epIHf6BEBDOlkv7VJJaveF1y2Mse8TvDilRyzs latest"
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
