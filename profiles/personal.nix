{config, ...}: let
  name = "Brian Choy";
  email = "bycEEE@gmail.com";
  pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqeyKQGFLXGhNpu6RwFfbJdofRlfj0aLO0iVvWAyp52";
in {
  programs.git = {
    settings = {
      user.name = name;
      user.email = email;
    };
    signing = {
      key = pubkey;
      signByDefault = true;
    };
    settings = {
      gpg.ssh.allowedSignersFile = "${config.home.homeDirectory}/.ssh/allowed_signers";
    };
  };
  home.file.".ssh/allowed_signers".text = ''
    ${email} namespaces="git" ${pubkey}
  '';
}
