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
  };

}
