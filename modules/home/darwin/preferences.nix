# https://macos-defaults.com
# https://lupin3000.github.io/macOS/defaults/
{...}: {
  targets.darwin = {
    currentHostDefaults = {
      "com.apple.controlcenter" = {
        BatteryShowPercentage = true; # Show battery percentage in the menu bar
      };
    };

    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true; # Show all file extensions inside the Finder (killall Finder)
        NSAutomaticCapitalizationEnabled = false; # Disable automatic capitalization
        NSAutomaticDashSubstitutionEnabled = false; # Disable smart dashes
        NSAutomaticPeriodSubstitutionEnabled = false; # Disable period with double space
        NSAutomaticQuoteSubstitutionEnabled = false; # Disable smart quotes
        NSAutomaticSpellingCorrectionEnabled = false; # Disable auto-correct
      };

      # (killall Finder)
      "com.apple.finder" = {
        ShowPathbar = true; # Show the path bar in Finder
        FXPreferredViewStyle = "Nlsv"; # Use list view in all Finder windows by default
        # _FXShowPosixPathInTitle = true; # Display full POSIX path as Finder window title
      };

      # (killall Dock)
      "com.apple.dock" = {
        orientation = "left"; # Put the Dock on the left of the screen
        tilesize = 32; # Set the icon size of Dock items to 32 pixels
      };
    };
  };

  # home.activation = lib.mkIf isWsl {
  #   linkDesktopApplications = {
  #     after = ["writeBoundary" "createXdgUserDirectories"];
  #     before = [];
  #     data = ''
  #       rm -rf ${config.xdg.dataHome}/"applications/home-manager"
  #       mkdir -p ${config.xdg.dataHome}/"applications/home-manager"
  #       cp -Lr ${config.home.homeDirectory}/.nix-profile/share/applications/* ${config.xdg.dataHome}/"applications/home-manager/"
  #     '';
  #   };
  # };
}
