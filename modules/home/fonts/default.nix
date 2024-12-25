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
      nerd-fonts.hack
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.inconsolata
      nerd-fonts.sauce-code-pro
      nerd-fonts.iosevka
      nerd-fonts.agave
      nerd-fonts.monaspace
      (pkgs.callPackage ./sf-mono-nerdfont.nix {})
      # (pkgs.callPackage ./apple-fonts.nix {})
    ];
  };
}
