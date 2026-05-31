{...}: {
  programs.ghostty = {
    enable = true;
    package = null;
    settings = {
      auto-update = "check";
      auto-update-channel = "stable";
      macos-icon = "holographic";

      theme = "Catppuccin Macchiato";
      font-family = "Hack Nerd Font Mono";
      font-size = 13.5;
      font-thicken = true;
      font-thicken-strength = 128;

      working-directory = "inherit";
      scrollback-limit = 10000000; # In bytes, not lines
      bell-features = "system,audio,attention,title";
      copy-on-select = "clipboard";
      window-colorspace = "display-p3";
      window-save-state = "always";
      window-new-tab-position = "end";
      mouse-shift-capture = true;
    };
  };
}
