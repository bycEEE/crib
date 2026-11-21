{ lib, ... }: {
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
      clipboard-trim-trailing-spaces = true;
      selection-word-chars = "\" \\t'\"│`|:,()[]{}<>$";
      window-colorspace = "display-p3";
      window-save-state = "always";
      window-new-tab-position = "end";
      working-directory = "inherit";

      macos-auto-secure-input = false; # Fixes issue with global key remaps

      # only act when there's another tab/split to switch to; otherwise pass the
      # key through so herdr (see herdr.nix) can use the same bindings
      keybind = [
        "performable:super+shift+]=next_tab"
        "performable:super+shift+[=previous_tab"
        "performable:super+]=goto_split:next"
        "performable:super+[=goto_split:previous"
        "performable:super+alt+arrow_left=goto_split:left"
        "performable:super+alt+arrow_right=goto_split:right"
        "performable:super+alt+arrow_up=goto_split:up"
        "performable:super+alt+arrow_down=goto_split:down"
        # ghostty always consumes these (jump_to_prompt/goto_tab), so hand them
        # to herdr outright: workspaces, agents, and workspace by index
        "super+arrow_up=unbind"
        "super+arrow_down=unbind"
        "super+shift+arrow_up=unbind"
        "super+shift+arrow_down=unbind"
        "super+9=unbind"
      ]
      # ghostty binds both the character (super+1) and physical key (super+digit_1)
      ++ (lib.concatMap
        (n: [
          "super+${toString n}=unbind"
          "super+digit_${toString n}=unbind"
        ])
        [
          1
          2
          3
          4
          5
          6
          7
          8
        ]
      );
    };
  };
}
