{...}: {
  programs.ghostty = {
    enable = true;
    package = null;
    systemd.enable = false;
    settings = {
      auto-update = "check";
      auto-update-channel = "stable";
      macos-icon = "holographic";

      theme = "Catppuccin Macchiato";
      font-family = "MonaspiceNe Nerd Font Mono";
      font-feature = "liga,calt";
      font-size = 13.5;
      font-thicken = true;
      font-thicken-strength = 120;
      macos-titlebar-style = "tabs";
      unfocused-split-opacity = 0.5;
      window-padding-x = 10;
      window-padding-y = 10;

      bell-features = "system,audio,attention,title";
      copy-on-select = "clipboard";
      mouse-shift-capture = true;
      selection-word-chars = "\" \\t'\"│`|:,()[]{}<>$\"";
      scrollback-limit = 10000000; # In bytes, not lines
      window-colorspace = "display-p3";
      window-save-state = "always";
      window-new-tab-position = "end";
      working-directory = "inherit";
    };
  };
}
