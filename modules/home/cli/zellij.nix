{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "Catppuccin Frappe";
      pane_frames = false;
      scroll_buffer_size = 50000;
    };
  };
}
