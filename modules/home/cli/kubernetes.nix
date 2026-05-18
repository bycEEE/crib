{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    chart-testing # CLI tool for linting and testing Helm charts
    helm-docs # Generate documentation from Kubernetes Helm charts
    helmfile # Declaratively deploy your Kubernetes manifests, Kustomize configs, and Charts as Helm releases. Generate all-in-one manifests for use with ArgoCD.
    kind # Kubernetes IN Docker - local clusters for testing Kubernetes
    # kompose # Tool to move from docker-compose to Kubernetes
    kubectl
    kubectx # Switch faster between clusters and namespaces in kubectl
    kubent # Easily check your clusters for use of deprecated APIs
    (wrapHelm kubernetes-helm {
      plugins = with kubernetes-helmPlugins; [
        helm-diff
        helm-secrets
      ];
    })
    kustomize
    # skaffold # Easy and Repeatable Kubernetes Development
    stern # Multi pod and container log tailing for Kubernetes
    # tanka # Flexible, reusable and concise configuration for Kubernetes
  ];

  programs = {
    k9s = {
      enable = true;
      # From https://github.com/hmajid2301/dotfiles/blob/main/home-manager/programs/starship.nix
      skins = {
        k9s = {
          body = {
            fgColor = "#${config.colorscheme.palette.base05}";
            bgColor = "#${config.colorscheme.palette.base00}";
            logoColor = "#${config.colorscheme.palette.base0E}";
          };
          prompt = {
            fgColor = "#${config.colorscheme.palette.base05}";
            bgColor = "#${config.colorscheme.palette.base01}";
            suggestColor = "#${config.colorscheme.palette.base0D}";
          };
          info = {
            fgColor = "#${config.colorscheme.palette.base09}";
            sectionColor = "#${config.colorscheme.palette.base05}";
          };
          dialog = {
            fgColor = "#${config.colorscheme.palette.base0A}";
            bgColor = "#9399b2";
            buttonFgColor = "#${config.colorscheme.palette.base00}";
            buttonBgColor = "#7f849c";
            buttonFocusFgColor = "#${config.colorscheme.palette.base00}";
            buttonFocusBgColor = "#f5c2e7";
            labelFgColor = "#${config.colorscheme.palette.base06}";
            fieldFgColor = "#${config.colorscheme.palette.base05}";
          };
          frame = {
            border = {
              fgColor = "#${config.colorscheme.palette.base0E}";
              focusColor = "#b4befe";
            };
            menu = {
              fgColor = "#${config.colorscheme.palette.base05}";
              keyColor = "#${config.colorscheme.palette.base0D}";
              numKeyColor = "#eba0ac";
            };
            crumbs = {
              fgColor = "#${config.colorscheme.palette.base00}";
              bgColor = "#eba0ac";
              activeColor = "#${config.colorscheme.palette.base0F}";
            };
            status = {
              newColor = "#${config.colorscheme.palette.base0D}";
              modifyColor = "#b4befe";
              addColor = "#${config.colorscheme.palette.base0B}";
              pendingColor = "#${config.colorscheme.palette.base09}";
              errorColor = "#${config.colorscheme.palette.base08}";
              highlightColor = "#89dceb";
              killColor = "#${config.colorscheme.palette.base0E}";
              completedColor = "#6c7086";
            };
            title = {
              fgColor = "#94e2d5";
              bgColor = "#${config.colorscheme.palette.base00}";
              highlightColor = "#f5c2e7";
              counterColor = "#${config.colorscheme.palette.base0A}";
              filterColor = "#${config.colorscheme.palette.base0B}";
            };
          };
          views = {
            charts = {
              bgColor = "#${config.colorscheme.palette.base00}";
              chartBgColor = "#${config.colorscheme.palette.base00}";
              dialBgColor = "#${config.colorscheme.palette.base00}";
              defaultDialColors = ["#${config.colorscheme.palette.base0B}" "#${config.colorscheme.palette.base08}"];
              defaultChartColors = ["#${config.colorscheme.palette.base0B}" "#${config.colorscheme.palette.base08}"];
              resourceColors = {
                cpu = ["#${config.colorscheme.palette.base0E}" "#${config.colorscheme.palette.base0D}"];
                mem = ["#${config.colorscheme.palette.base0A}" "#${config.colorscheme.palette.base09}"];
              };
            };
            table = {
              fgColor = "#${config.colorscheme.palette.base05}";
              bgColor = "#${config.colorscheme.palette.base00}";
              cursorFgColor = "#313244";
              cursorBgColor = "#45475a";
              markColor = "#${config.colorscheme.palette.base06}";
              header = {
                fgColor = "#${config.colorscheme.palette.base0A}";
                bgColor = "#${config.colorscheme.palette.base00}";
                sorterColor = "#89dceb";
              };
            };
            xray = {
              fgColor = "#${config.colorscheme.palette.base05}";
              bgColor = "#${config.colorscheme.palette.base00}";
              cursorColor = "#45475a";
              cursorTextColor = "#${config.colorscheme.palette.base00}";
              graphicColor = "#f5c2e7";
            };
            yaml = {
              keyColor = "#${config.colorscheme.palette.base0D}";
              colonColor = "#a6adc8";
              valueColor = "#${config.colorscheme.palette.base05}";
            };
            logs = {
              fgColor = "#${config.colorscheme.palette.base05}";
              bgColor = "#${config.colorscheme.palette.base00}";
              indicator = {
                fgColor = "#b4befe";
                bgColor = "#${config.colorscheme.palette.base00}";
              };
            };
          };
          help = {
            fgColor = "#${config.colorscheme.palette.base05}";
            bgColor = "#${config.colorscheme.palette.base00}";
            sectionColor = "#${config.colorscheme.palette.base0B}";
            keyColor = "#${config.colorscheme.palette.base0D}";
            numKeyColor = "#eba0ac";
          };
        };
      };
    };
  };
}
