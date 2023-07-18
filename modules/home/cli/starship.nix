{lib, ...}: {
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$directory"
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
        format = "\\[[⏱ $duration]($style)\\]";
        style = "yellow";
      };

      memory_usage = {
        format = "\\[$symbol[$${ram}( | $${swap})]($style)\\]";
        threshold = 70;
        style = "bold dimmed white";
        disabled = true;
      };

      time = {
        time_format = "[%m/%d/%Y %T]";
        format = "$time($style) ";
        style = "bright-white";
        disabled = false;
      };

      username = {
        format = "\\[[$user]($style)\\]";
        style_user = "bold dimmed blue";
        show_always = false;
      };

      hostname = {
        ssh_only = true;
        format = "<[$hostname]($style)>";
        trim_at = "-";
        style = "bold dimmed white";
        disabled = true;
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
        style = "dimmed green";
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
        format = ''( [\[$all_status$ahead_behind\]]($style))'';
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
        format = "\\[[$symbol($profile)(\\($region\\))(\\[$duration\\])]($style)\\]";
        style = "yellow";
        disabled = true;
      };

      bun = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      c = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      cmake = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      cobol = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      conda = {
        format = "\\[[$symbol$environment]($style)\\]";
      };

      crystal = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      daml = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      dart = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      deno = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      docker_context = {
        format = "\\[[$symbol$context]($style)\\]";
      };

      dotnet = {
        format = "\\[[$symbol($version)(🎯 $tfm)]($style)\\]";
      };

      elixir = {
        format = "\\[[$symbol($version \\(OTP $otp_version\\))]($style)\\]";
      };

      elm = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      erlang = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      fennel = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      fossil_branch = {
        format = "\\[[$symbol$branch]($style)\\]";
      };

      gcloud = {
        format = "\\[[$symbol$account(@$domain)(\\($region\\))]($style)\\]";
      };

      golang = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      gradle = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      guix_shell = {
        format = "\\[[$symbol]($style)\\]";
      };

      haskell = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      haxe = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      helm = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      hg_branch = {
        format = "\\[[$symbol$branch]($style)\\]";
      };

      java = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      julia = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      kotlin = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      kubernetes = {
        format = "\\[[$symbol$context( \\($namespace\\))]($style)\\] ";
        symbol = "⎈ ";
        style = "cyan bold";
        disabled = false;
      };

      lua = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      meson = {
        format = "\\[[$symbol$project]($style)\\]";
      };

      nim = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      nix_shell = {
        format = "\\[[$symbol$state( \\($name\\))]($style)\\]";
      };

      nodejs = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      ocaml = {
        format = "\\[[$symbol($version)(\\($switch_indicator$switch_name\\))]($style)\\]";
      };

      opa = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      openstack = {
        format = "\\[[$symbol$cloud(\\($project\\))]($style)\\]";
      };

      os = {
        format = "\\[[$symbol]($style)\\]";
      };

      package = {
        format = "\\[[$symbol$version]($style)\\]";
        disabled = true;
      };

      perl = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      php = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      pijul_channel = {
        format = "\\[[$symbol$channel]($style)\\]";
      };

      pulumi = {
        format = "\\[[$symbol$stack]($style)\\]";
      };

      purescript = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      python = {
        format = "\\[[$${symbol}$${pyenv_prefix}($${version})(\\($virtualenv\\))]($style)\\]";
        style = "bold green";
      };

      raku = {
        format = "\\[[$symbol($version-$vm_version)]($style)\\]";
      };

      red = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      ruby = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      rust = {
        format = "\\[[$symbol($version)]($style)\\]";
        style = "bold green";
      };

      scala = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      spack = {
        format = "\\[[$symbol$environment]($style)\\]";
      };

      sudo = {
        format = "\\[[as $symbol]\\]";
      };

      status = {
        style = "red";
        symbol = "✖";
        not_executable_symbol = "🚫";
        not_found_symbol = "🔍";
        sigint_symbol = "⚡";
        signal_symbol = "⚡";
        format = "[\\[$symbol $status $common_meaning$signal_name$maybe_int\\]]($style) ";
        map_symbol = true;
        disabled = false;
      };

      swift = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      terraform = {
        format = "\\[[$symbol$workspace]($style)\\]";
      };

      vagrant = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      vlang = {
        format = "\\[[$symbol($version)]($style)\\]";
      };

      zig = {
        format = "\\[[$symbol($version)]($style)\\]";
      };
    };
  };
}
