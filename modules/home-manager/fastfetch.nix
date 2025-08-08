{
  enable = true;
  # package = pkgs-unstable.fastfetch;
  settings = {
    # $XDG_CONFIG_HOME/fastfetch/config.jsonc
    logo = {
      source = "nixos_normal"; # nixos_small #nixos_old
      padding = {
        right = 1;
      };
    };
    display = {
      size = {
        binaryPrefix = "si";
      };
      color = "blue";
      # separator = "  ";
      separator = " ";
    };
    modules = [
      # "os"
      {
        "type" = "os";
        "key" = "DISTRO";
        "keyColor" = "red";
      }
      {
        "type" = "cpu";
        "key" = "CPU";
        "keyColor" = "red";
      }
      {
        "type" = "gpu";
        "key" = "GPU";
        "keyColor" = "red";
      }
      {
        "type" = "memory";
        "key" = "MEMORY";
        "keyColor" = "red";
      }
      {
        type = "datetime";
        key = "Date";
        format = "{1}-{3}-{11}";
      }
      {
        type = "datetime";
        key = "Time";
        format = "{14}:{17}:{20}";
      }
      "break"
      "player"
      {
        "type" = "display";
        "key" = "MONITOR ({name})";
        "keyColor" = "blue";
        # "format" = "{width}x{height} @ {refresh-rate} Hz - {physical-width}x{physical-height} mm ({inch} inches, {ppi} ppi)";
        "format" = "{width}x{height} @ {refresh-rate} Hz";
      }
      "uptime"
      "packages"
    ];
  };
}
