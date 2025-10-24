{...}: {
  programs.git = {
    settings = {
      user.name = "Brian Choy";
      user.email = "bycEEE@gmail.com";
    };
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINWcwuVWLxEG4/dbXI/yA+v8g5CGXeFg0VBVvYlLfHcO";
      signByDefault = true;
    };
  };
}
