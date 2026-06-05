{
  programs.git = {
    enable = true;
    lfs = {
      enable = false;
    };
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILPpL9epIHf6BEBDOlkv7VJJaveF1y2Mse8TvDilRyzs latest";
      signByDefault = true;
    };
    settings = {
      gpg = {
        format = "ssh";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true; # does --set-upstream origin to current branch
      user = {
        name = "paperpegasus";
        email = "paperpegasus@github.com";
      };
      #credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
      #safe.directory = "/etc/nixos";
    };
    ignores = [
      "*.swp"
      ".stfolder.*"
      ".stfolder*"
      "*org-roam.db"
      "brain/"
    ];
    # aliases = {
    #   ci = "commit";
    #   co = "checkout";
    #   s = "status";
    #   p = "push";
    # };
  };

}
