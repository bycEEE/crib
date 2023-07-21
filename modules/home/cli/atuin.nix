{...}: {
  programs.atuin = {
    enable = true;
    flags = [
      # disable up arrow hijacking
      "--disable-up-arrow"
    ];

    settings = {
      # nix manages this
      update_check = false;
      # search history from all hosts, all sessions, all directories
      filter_mode = "global";
      # fuzzy finder search syntax borrowed from fzf
      search_mode = "skim";
      # disable fancy display
      style = "compact";
      # show preview of command at bottom
      show_preview = true;
    };
  };
}
