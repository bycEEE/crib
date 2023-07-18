{config, ...}: {
  # Copied from: https://github.com/fortuneteller2k/nix-config/blob/master/modules/shared/home-manager/default.nix
  programs.htop = {
    enable = true;
    settings =
      {
        detailed_cpu_time = true;
        hide_kernel_threads = false;
        show_cpu_frequency = true;
        show_cpu_usage = true;
        show_program_path = false;
        show_thread_names = true;

        fields = with config.lib.htop.fields; [
          PID
          USER
          PRIORITY
          NICE
          M_SIZE
          M_RESIDENT
          M_SHARE
          STATE
          PERCENT_CPU
          PERCENT_MEM
          TIME
          COMM
        ];
      }
      // (with config.lib.htop;
        leftMeters [
          (bar "AllCPUs")
          (bar "Memory")
          (bar "Swap")
        ])
      // (with config.lib.htop;
        rightMeters [
          (text "Tasks")
          (text "LoadAverage")
          (text "Uptime")
        ]);
  };
}
