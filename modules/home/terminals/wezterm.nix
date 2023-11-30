{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.terminals.wezterm;
in {
  options.modules.terminals.wezterm = {
    enable = mkEnableOption "enable wezterm terminal emulator";
  };

  config = mkIf cfg.enable {
    programs.wezterm = {
      enable = true;
      package = [];
      extraConfig = ''
        local wezterm = require 'wezterm'
        local act = wezterm.action
        return {
          font = wezterm.font("Hack Nerd Font"),
          font_size = 12.0,
          line_height = 1.2,
          color_scheme = "Catppuccin Macchiato",
          -- default_prog = { "zsh", "--login" },
          window_decorations = "RESIZE",
          initial_rows = 30,
          initial_cols = 120,
          inactive_pane_hsb = {
            saturation = 0.8,
            brightness = 0.7,
          },
          use_dead_keys = false,
          scrollback_lines = 10000,
          keys = {
            { key = ']', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(1) },
            { key = '[', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(-1) },
            { key = ']', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
            { key = '[', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
            { key = ']', mods = 'ALT', action = act.ActivatePaneDirection 'Next' },
            { key = '[', mods = 'ALT', action = act.ActivatePaneDirection 'Prev' },
            -- { key = 'Enter', mods = 'CMD', action = act.ActivateCopyMode },
            -- { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
            { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
            { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
            { key = '0', mods = 'CTRL', action = act.ResetFontSize },
            { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
            { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
            { key = 'v', mods = 'CMD', action = act.PasteFrom 'Clipboard' },
            { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
            { key = 't', mods = 'CMD', action = act.SpawnTab 'CurrentPaneDomain' },
            { key = 'w', mods = 'CTRL', action = act.CloseCurrentPane { confirm = false } },
            { key = 'w', mods = 'CMD', action = act.CloseCurrentPane { confirm = false } },
          }
        }
      '';
    };
  };
}
