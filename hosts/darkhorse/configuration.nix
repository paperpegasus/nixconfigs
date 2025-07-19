# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nix
    ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 
  # networking
  networking.hostName = "darkhorse"; # Define your hostname.
  networking.hostId = "e4ce6b52";

  # Set your time zone.
  time.timeZone = "Africa/Nairobi";

    # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

nix = let
  users = [ "root" "paperpegasus" ];
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

 nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  "broadcom-sta"
  "discord"
  "google-chrome"
  "vscode"
 ];


 # Set zsh as default shell
 # users.defaultUserShell = pkgs.zsh;

 programs.zsh.enable = true;
 # Define a user account. Don't forget to set a password with  passwd .
 users.users.paperpegasus = {
   # useDefaultShell = true;
   openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJueLlKNTuLZI9ForDV9r6xJAXGwRYvEloVS5owm51Yp paperpegasus@github.com"
    ];
   shell = pkgs.zsh;
   isNormalUser = true;
   initialHashedPassword = "$6$4k7GWIhnAUu6JLZd$EQ.5184j5nGLpe1gvkCNXWI9/iwkA7veBsrwkYXIY5ZioDpjaNOZtnEi5R5GpVcsh/1YS2rabMj.7l/G9UQuy0";
   extraGroups = [ "wheel" ]; # Enable  sudo  for the user.
   packages = with pkgs; [
     #tree
   ];
 };
  environment.systemPackages = with pkgs; [
    wget
    vim
    tree
    sl
    ripgrep
    neovim
    go
    emacs
    awscli2
    alacritty
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}

