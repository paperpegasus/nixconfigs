{
  imports = [
    ./git.nix
    ./bash.nix
    ./starship.nix
    ./emacs
    ./kitty
    ./ghostty
    ./vim.nix
    ./zed
  ];
  programs = {
    fzf = import ./fzf.nix;
    fd = import ./fd.nix;
    fastfetch = import ./fastfetch.nix;
    lsd = import ./lsd.nix;
    git-credential-oauth = {
      enable = true;
      extraFlags = [ "-device" ];
    };
    ripgrep = {
      enable = true;
      arguments = [
        # https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file
        "--max-columns-preview"
        "--colors=line:style:bold"
      ];
    };
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    bash.enable = true; # see note on other shells below
  };
}
