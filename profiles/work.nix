{...}: {
  programs.git = {
    settings = {
      user.name = "Brian Choy";
      user.email = "bycEEE@gmail.com";
    };
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDzMHZwClyJHxko4fYErJAF9iLOB+zRMWFKparZ4s9F4";
      signByDefault = true;
    };
  };
}
