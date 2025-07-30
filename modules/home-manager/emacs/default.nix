# default.nix
{ pkgs, ... }:
{
  imports = [
    ./emacsPkgs.nix
  ];

  config = {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs-pgtk;
    };

    services.emacs = {
      enable = true; # emacs daemon
      # whether to launch Emacs service with the systemd user session. "graphical" -> graphical-session.target ( if true -> default.target::)
      # startWithUserSession = if osConfig.networking.hostName == "tangier" then false else true;
      startWithUserSession = true;
      # defaultEditor = false; # $EDITOR
      socketActivation.enable = true;
      client = {
        # Whether to enable systemd socket activation for the Emacs service. # TODO see if conflicting with startWithUSerSession
        enable = true; # false::, generation of Emacs client desktop file.
        arguments = [
          "-c" # -r --reuse-frame (reuse frame if exists, otherwise create a new frame) - --create-frame/-c
          # "-nw"
          # "-a 'emacs'"
        ];
      };
      extraOptions = [
        "-r"
      ];
    };
  };
}
