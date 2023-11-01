{pkgs, ...}:
/*
home-manager configuration
Useful links:
- Home Manager Manual: https://nix-community.gitlab.io/home-manager/
- Appendix A. Configuration Options: https://nix-community.gitlab.io/home-manager/options.html
*/
{
  fonts.fontconfig.enable = true;
  home = {
    packages = with pkgs; [
      ### Fonts
      (nerdfonts.override {
        fonts = [
          "Hack"
          "FiraCode"
          "JetBrainsMono"
          "Terminus"
          "Iosevka"
        ];
      })
      (pkgs.callPackage ./sf-mono-nerdfont.nix {})
      # (pkgs.callPackage ./apple-fonts.nix {})
    ];
  };
}
