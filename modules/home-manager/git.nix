{
  programs.git = {
    enable = true;
    lfs = {
      enable = false;
    };
    settings = {
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
