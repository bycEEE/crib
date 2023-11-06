{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "Catppuccin Macchiato";
      pane_frames = false;
      scroll_buffer_size = 50000;
    };
  };
}
