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
      macos-titlebar-style = "tabs";
      window-padding-x = 10;
      window-padding-y = 10;
      unfocused-split-opacity = 0.5;

      working-directory = "inherit";
      scrollback-limit = 50000000; # In bytes, not lines
      bell-features = "system,audio,attention,title";
      copy-on-select = "clipboard";
      window-colorspace = "display-p3";
      window-save-state = "always";
      window-new-tab-position = "end";
      mouse-shift-capture = true;
    };
  };
}
