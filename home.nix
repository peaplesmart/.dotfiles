{ config, pkgs, lib, ... }:

{

  home.username = "ichal";
  home.homeDirectory = "/home/ichal";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
  home.packages =  with pkgs; [
  ];

### Theming
##  Enable Gtk
#  qt = {
#      enable = true;
#      platformTheme.name = "gnome";
#      style.name = "adwaita";
#    };

gtk = {
    enable = true;
    theme.package = pkgs.solarc-gtk-theme;
    theme.name = "SolArc-Dark";
  };

### Programs
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = ''
        $os$directory$character
      '';
      right_format = ''
        ($nix_shell) $git_branch $git_status
      '';
      scan_timeout = 10;
      line_break.disabled = true;

      os = {
        format = "[](fg:#7DAEA3 bg:none)[$symbol]($style)[](fg:#7DAEA3 bg:#26243C)";
        symbols.NixOS = "󰊠 ";
        style = "fg:#131313 bg:#7DAEA3";
        disabled = false;
        };

      directory = {
        format = "[](fg:#26243C bg:#26243C)[󰉋 ](fg:#D8A657 bg:#26243C)[ $path ](fg:#D8A657 bg:#26243C)[](fg:#26243C bg:none)";
        truncation_length = 3;
        truncate_to_repo = false;
        };

        git_branch = {
        format = "[](fg:#A9B665 bg:none)[](fg:#131313 bg:#A9B665)[](fg:#A9B665 bg:#A9B665)[$branch ](fg:#131313 bg:#A9B665)[](fg:#A9B665 bg:none)";
      };

      git_status = {
        format = "[](fg:#232526 bg:none)[$all_status $ahead_behind]($style)[](fg:#232526 bg:#232526)[](fg:#67afc1 bg:#232526)[  ](fg:#232526 bg:#67afc1)[](fg:#67afc1 bg:none)";
        style = "fg:#D4BE98 bg:#232526";
        conflicted = "=";
        ahead = "⇡$\{count\}";
        behind = "⇣$\{count\}";
        diverged = "⇕⇡$\{ahead_count\}⇣$\{behind_count\}";
        up_to_date = "";
        untracked = "?$\{count\}";
        stashed = "";
        modified = "!$\{count\}";
        staged = "+$\{count\}";
        renamed = "»$\{count\}";
        deleted = "$\{count\}";
      };

      character = {
        success_symbol = "[ 󱐋 ](bold yellow)";
        error_symbol = "[ 󱐋 ](bold red)";
        vicmd_symbol = "[  ](bold green)";
      };

      nix_shell = {
        impure_msg = "";
        symbol = " ";
        heuristic = true;
        format = "[($name \\(develop\\)) ]($style)[](fg:#7DAEA3 bg:none)[$symbol](fg:#131313 bg:#7DAEA3)[](fg:#7DAEA3 bg:none)";
        };
      };
  };

  programs.bash = {
    enable = true;
    enableCompletion = false;
    enableVteIntegration = true;
    bashrcExtra = ''

          # Attempt to save all lines of a multiple-line command in the same entry
          shopt -s cmdhist

          ## After each command, append to the history file and reread it
          PROMPT_COMMAND="''${PROMPT_COMMAND:+$PROMPT_COMMAND$"\n"}history -a; history -c; history -r"

          ## Print the timestamp of each command
          HISTTIMEFORMAT="%Y%m%d.%H%M%S%z "

          ## Set History File Size
          HISTFILESIZE=2000000

          ## Set History Size in memory
          HISTSIZE=3000

          ## Don't save ls,ps, history commands
          export HISTIGNORE="ls:ll:ls -alh:pwd:clear:history:ps"

          ## Do not store a duplicate of the last entered command and any commands prefixed with a space
          HISTCONTROL=ignoreboth
    '';
  };

  programs.git ={
    enable = true;
    userName = "Priza Marwinsyah";
    userEmail = "peaplesmart@gmail.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingKey = "~/.ssh/id_ed25519.pub";
    };
  };

  programs.fzf ={
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    defaultOptions = [
    "--height 40%"
    "--border"
    ];
  };

  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "Dracula";
    };
  };

  programs.eza = {
    enable = true;
    extraOptions = [
    "--group-directories-first"
    "--header"
    "--icons"
    ];
  };

  programs.fish = {
    enable = true;
    shellAliases = {
    };
  };


  home.file = {
   # ".config/starship.toml".source = ./starship.toml;
  };

}
