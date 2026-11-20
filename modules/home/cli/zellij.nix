{...}: {
  programs.zellij = {
    enable = false;
    settings = {
      theme = "Catppuccin Macchiato";
      pane_frames = false;
      scroll_buffer_size = 50000;
    };
  };
}
