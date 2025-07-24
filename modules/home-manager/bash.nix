{
  programs.bash = {
    enable = true;
    shellOptions = [
      "histappend"
      "checkwinsize"
      "extglob"
      "globstar"
      "checkjobs"
    ];
    historyFileSize = 100000;
    shellAliases = {
      ".." = "cd ..";
      "_" = "cd -";
    };
    initExtra =
      # during interactive shell init
      ''
        #complete command + file names. Investigate if needed
        #complete -cf sudo

        # export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin" # should be below in bashrcExtra
        if command -v fzf-share >/dev/null; then
          source "$(fzf-share)/key-bindings.bash"
          source "$(fzf-share)/completion.bash"
        fi
      '';
  };

}
