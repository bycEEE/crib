{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # todo add https://github.com/stealthsploit/OneRuleToRuleThemStill
      john # John the Ripper password cracker
      hashcat # Fast password cracker
    ];
  };
}
