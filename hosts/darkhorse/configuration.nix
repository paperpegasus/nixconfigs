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

      "broadcom-sta-6.30.223.271-57-6.12.39"
      "nvidia-x11"
      "nvidia-settings"
      "broadcom-sta"
      "discord"
      "google-chrome"
      "vscode"
    ];
  nixpkgs.config.permittedInsecurePackages = [
    "broadcom-sta-6.30.223.271-57-6.12.39"
  ];

  # Define a user account. Don't forget to set a password with  passwd .
  users.users.paperpegasus = {
    # useDefaultShell = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINP/nLlQ/8DjAgM5RMmFR406DicjlXq4w+EpdnfuDIaU xriseugene@gmail.com"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyP19s1FEECnccJe7rcZxkQ2tIlC83bSzctRNSHerJx2qoeTKIEiUEE+XqN1DWLlfsj3rJCFqkK+AtI/ivY9MTou3s2Oc+bw+71BZoQxO8qC6A86qhWuwwvFs1A2igDw41XqJ/eSh91aT7I9Jwli+Y8NEJLuLjF9fcYFODX1cSSyg2WOrVIm84zdx1NXwkNsrf1eZvGPB1cCQPhNqA52GDphm9HegyF5grP0TPfWokxDnuzmOHH5ci750MgBpOR86U7/1ulTcCvHlzgIUkgg6ytN/sL/SNzq/sszRc3NovnBD4IlFLk+UVvMgm+0vr1HI7j1RfS0zRAxgok6dkENWhsWNuiAMswo4gHrfkC0LrZxKshAqklEIUzqnu6sVFkIC8RjBILclsFCCF7PFHg8KXS1xbSxDzS5uq7+OatpzhJWdkUdS9kFN4pfOxxATox8WaVWOPftfsSWwNK9LqROHJF3gR941W1RoYQAQgK560ihgJR604GREVAHJ6Y7+5RU0= paperpegasus@github.com"
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
