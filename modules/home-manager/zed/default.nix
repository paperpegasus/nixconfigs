{
  programs.zed-editor = {
    enable = true;
    userSettings = {

      relative_line_numbers = true;
      auto_install_extensions = {
        nix = true;
        go = true;
        elixir = true;
        catppuccin = true;
      };
      #show_whitespaces = "all" ;
      ui_font_size = 12;
      buffer_font_size = 12;
      buffer_font_family = "JetBrains Mono";
      buffer_font_weight = 400; # default 400, 100-900
      buffer_line_height = "comfortable";
      current_line_highlight = "line"; # line, none, all, gutter
      confirm_quit = true;
      hour_format = "hour24";
      auto_update = false;
      remove_trailing_whitespace_on_save = true;
      show_whitespaces = "selection"; # selection, boundary, all , none
      soft_wrap = "editor_width"; # def: none, # edditor_width, prefer_line_length
      hard_tabs = false; # tabs or spaces, false for tabs #TODO:test
      tab_size = 2; # how many columns a tab should occupy
      hover_popover_enabled = true;
      vim_mode = true;
      # autoscroll_on_clicks = true;

      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };

      # assistant = {
      #     enabled = false;
      #     version = "2";
      #     default_open_ai_model = null;
      #     default_model = {
      #         provider = "zed.dev";
      #         model = "claude-3-5-sonnet-latest";
      #     };
      # };

      scrollbar = {
        show = "never"; # auto, never, always
        cursors = true;
        git_diff = true;
        search_results = true;
        selected_symbol = true;
        #diagnostics = true;
      };

      tabs = {
        close_position = "right";
        file_icons = true;
        git_status = true;
        #activate_on_close = "history";
        activate_on_close = "neighbour"; # history, neighbour
        always_show_close_button = false;
      };

      enable_language_server = true; # on default
      # format_on_save = "on";

      formatter = "prettier"; # language_server , auto, prettier, external
      # formatter = {
      #   external = {
      #     command = "prettier";
      #     arguments = ["--stdin-filepath" "{buffer_path}"];
      # };

      toolbar = {
        breadcrumbs = true;
        quick_actions = true;
      };

      terminal = {
        alternate_scroll = "off";
        blinking = "on";
        copy_on_select = true;
        dock = "bottom";
        font_family = "Zed Plex Mono";
        font_size = 12;
        line_height = "comfortable";
        option_as_meta = false;
        button = false;
        shell = "system";
        toolbar = {
          title = true;
        };
        working_directory = "current_project_directory";
        cursor_blink = false;
        cursor_shape = "bar"; # block, bar, hollow,underline
      };

      project_panel = {
        indent_guides = {
          show = "always"; # never, always
        };
      };

      languages = {
        "Python" = {
          tab_size = 4;
        };
        "Go" = {
          tab_size = 4;
          language_servers = [
            "gopls"
          ];
        };
        "nix" = {
          tab_size = 2;
          language_servers = [
            "nixd"
            "..."
          ];
          prettier = {
            allowed = true;
          };
        };
      };

      lsp = {
        discord_presence = {
          initialization_options = {
            # Application ID for the rich presence
            application_id = "1263505205522337886";
            base_icons_url = "https://raw.githubusercontent.com/xhyrom/zed-discord-presence/main/assets/icons/";
            state = "Working on {filename}";
            details = "In {workspace}";

            # URL for the large image
            large_image = "{base_icons_url}/{language:lo}.png";
            large_text = "{language:u}";

            # URL for the small images
            small_image = "{base_icons_url}/zed.png";
            small_text = "Zed";

            # Idle settings - when inactive
            idle = {
              timeout = 300; # Idle timeout in seconds (5 minutes)

              # Action to take while idle
              # `change_activity` - changes the activity to idle with the following details
              # `clear_activty` - clears the activity (hides it)
              action = "change_activity";
              state = "Idling";
              details = "In Zed";
              large_image = "{base_icons_url}/zed.png";
              large_text = "Zed";
              small_image = "{base_icons_url}/idle.png";
              small_text = "Idle";
            };

            # Rules to disable presence in specific workspaces
            rules = {
              mode = "blacklist";
              paths = [ "absolute path" ];
            };

            git_integration = true;

            # Per-language overrides
            languages = {
              go = {
                state = "Hacking on {filename}";
                details = "Ghopher at work";
                large_image = "{base_icons_url}/go.png";
                large_text = "oh Goo";
                small_image = "{base_icons_url}/zed.png";
                small_text = "Zed";
              };
            };

          };
        }; # End of discord presence settings
      };

      vim = {
        toggle_relative_line_numbers = true;
        use_system_clipboard = "always";
        highlight_on_yank_durations = 200;
        # custom_digraphs = {}; #TODO: findout what this does
      };

      ## tell zed to use direnv and direnv can use a flake.nix enviroment.
      # load_direnv = "shell_hook";

      base_keymap = "JetBrains"; # VSCode, Atom,

      theme = {
        mode = "system"; # system, dark, light
        light = "Rosé Pine Dawn";
        dark = "Catppuccin Frappé";
      };

      icon_theme = {
        mode = "system";
        dark = "Catppuccin Frappé";
        light = "Catppuccin Latte";
      };

      indent_guides = {
        enabled = false;
        coloring = "disabled"; # disabled, indent_aware, "fixed"
        line_width = 1; # 1-10 in pixels
        active_line_width = 1; # 1-10
        background_coloring = "indent_aware"; # indent_aware, disabled
      };

      centered_layout = {
        left_padding = 0.2;
        right_padding = 0.2;
      };

      telemetry = {
        diagnostics = true;
        metrics = true;
      };

    }; # end of user settings
  }; # end of programs.zed
} # EOF
