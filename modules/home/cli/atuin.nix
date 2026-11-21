{ ... }: {
  programs.atuin = {
    enable = true;
    flags = [
      # disable up arrow hijacking
      "--disable-up-arrow"
    ];

    settings = {
      # nix manages this
      update_check = false;
      # search history from all sessions and hosts by default
      filter_mode = "global";
      # fuzzy finder search syntax borrowed from fzf
      search_mode = "skim";
      # disable fancy display
      style = "compact";
      # show preview of command at bottom
      show_preview = true;
      # capture AI agent sessions (Claude Code, Codex, ...) so `atuin threads resume` can find them
      threads.capture = true;
    };
    # threads are captured by the daemon (runs as a launchd agent on macOS)
    daemon.enable = true;
  };
  catppuccin.atuin.enable = true;
}
