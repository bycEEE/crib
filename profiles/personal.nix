{...}: {
  programs.git = {
    userName = "Brian Choy";
    userEmail = "bycEEE@gmail.com";
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqeyKQGFLXGhNpu6RwFfbJdofRlfj0aLO0iVvWAyp52";
      signByDefault = true;
    };
  };
}
