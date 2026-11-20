{pkgs, ...}: let
  toml = pkgs.formats.toml {};
in {
  xdg.configFile."herdr/config.toml".source = toml.generate "herdr-config.toml" {
    onboarding = false;

    theme = {
      name = "terminal";
    };

    # mirror ghostty's tab/split navigation (ghostty passes these through via
    # `performable:` when it has nothing to switch to)
    keys = {
      next_tab = "cmd+shift+]";
      previous_tab = "cmd+shift+[";
      cycle_pane_next = "cmd+]";
      cycle_pane_previous = "cmd+[";
      focus_pane_left = "cmd+alt+left";
      focus_pane_right = "cmd+alt+right";
      focus_pane_up = "cmd+alt+up";
      focus_pane_down = "cmd+alt+down";
    };

    ui = {
      # outer terminal window title
      window_title = "{workspace}";
      # no spacing between split panes
      pane_gaps = false;
      # hide the "copied to clipboard" toast
      toast.clipboard.enabled = false;
    };
  };
}
