{
  config,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$directory"
        "$username"
        "$hostname"
        "$git_branch"
        "$git_status"
        "$fill"
        "$all"
        "$time"
        "$line_break"
        "$kubernetes"
        "$character"
      ];

      fill = {
        symbol = " ";
      };

      # character = {
      #   success_symbol = "[♥](bold green)";
      #   error_symbol = "[♥](bold red)";
      #   vimcmd_symbol = "[♡](bold purple)";
      #   vimcmd_replace_symbol = "[♡](bold green)";
      #   vimcmd_replace_one_symbol = "[♡](bold green)";
      #   vimcmd_visual_symbol = "[♡](bold yellow)";
      # };

      # Shell
      battery.disabled = true;

      cmd_duration = {
        min_time = 1000;
        format = "[⏱ $duration]($style) ";
        style = "purple";
      };

      time = {
        time_format = "%m/%d/%Y %T";
        format = "[$time]($style) ";
        style = "bold yellow";
        disabled = false;
      };

      username = {
        format = "[$user]($style) ";
        style_user = "bold dimmed blue";
        show_always = false;
      };

      hostname = {
        ssh_only = true;
        ssh_symbol = "🌐";
        format = "$ssh_symbol$hostname($style) ";
        trim_at = ".";
        style = "bold dimmed white";
      };

      directory = {
        truncation_length = 5;
        truncate_to_repo = false;
        format = "[$path]($style)[$lock_symbol]($lock_style) ";
        style = "yellow";
        substitutions = {
          "Documents" = " ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };

      # Git
      git_branch = {
        format = "[$symbol$branch]($style) ";
        symbol = " ";
        style = "green";
      };

      # [git_state]
      # format = '\[[\($state( $progress_current of $progress_total)\)]($style)\]'

      git_status = {
        ahead = "↑";
        behind = "↓";
        conflicted = "±";
        deleted = "×";
        diverged = "↕";
        modified = "‼";
        renamed = "≡";
        stashed = "⌂";
        format = ''([\[$all_status$ahead_behind\]]($style))'';
        style = "dimmed green";
      };

      # git_status = {
      #   conflicted = "=";
      #   untracked = "?";
      #   stashed = "$";
      #   modified = "!";
      #   staged = "+";
      #   renamed = "~";
      #   deleted = "✘";
      #   ahead = "▲\$\{count\}";
      #   behind = "▼\$\{count\}";
      #   diverged = "♦ ▲\$\{ahead_count} ▼\$\{behind_count}";
      #   style = "dimmed green";
      # };

      # Language and tools

      aws = {
        format = "[$symbol($profile)(\\($region\\))(\\[$duration\\])]($style) ";
        style = "yellow";
        disabled = false;
      };

      golang = {
        format = "[$symbol($version)]($style) ";
      };

      helm = {
        format = "[$symbol($version)]($style) ";
        disabled = true;
      };

      kubernetes = {
        format = "[$symbol$context( \\($namespace\\))]($style) ";
        symbol = "⎈ ";
        style = "cyan bold";
        disabled = false;
      };

      nix_shell = {
        # format = "\\[[$symbol$state( \\($name\\))]($style)\\]";
        symbol = "❄️";
        format = "[$symbol$state( \\($name\\))]($style) ";
      };

      nodejs = {
        format = "[$symbol($version)]($style) ";
      };

      package = {
        format = "[$symbol$version]($style) ";
        disabled = true;
      };

      python = {
        format = "[$symbol$pyenv_prefix($version) (\\($virtualenv\\))]($style) ";
        style = "bold green";
      };

      status = {
        style = "red";
        symbol = "✖";
        not_executable_symbol = "🚫";
        not_found_symbol = "🔍";
        sigint_symbol = "⚡";
        signal_symbol = "⚡";
        format = "[$symbol $status $common_meaning$signal_name$maybe_int]($style) ";
        map_symbol = true;
        disabled = false;
      };

      terraform = {
        format = "[$symbol$workspace]($style) ";
      };
    };
  };
  catppuccin.starship.enable = true;
}
