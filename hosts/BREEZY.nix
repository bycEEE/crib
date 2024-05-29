{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # todo add https://github.com/stealthsploit/OneRuleToRuleThemStill
      # john # John the Ripper password cracker
      # hashcat # Fast password cracker

      # OSINT
      maigret # Collect a dossier on a person by username from thousands of sites
      sherlock # Find usernames across social networks
    ];
  };
}
