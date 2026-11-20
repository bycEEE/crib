{pkgs, ...}: let
  toml = pkgs.formats.toml {};
in {
  # herdr is installed via homebrew; this only manages its config
  # https://herdr.dev/docs/configuration/
  xdg.configFile."herdr/config.toml".source = toml.generate "herdr-config.toml" {
    onboarding = false;

    theme = {
      name = "catppuccin";
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
