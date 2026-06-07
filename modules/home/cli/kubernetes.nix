{pkgs, ...}: {
  home.packages = with pkgs; [
    chart-testing # CLI tool for linting and testing Helm charts
    eksctl # The official CLI for Amazon EKS
    helm-docs # Generate documentation from Kubernetes Helm charts
    helmfile # Declaratively deploy your Kubernetes manifests, Kustomize configs, and Charts as Helm releases. Generate all-in-one manifests for use with ArgoCD.
    kind # Kubernetes IN Docker - local clusters for testing Kubernetes
    # kompose # Tool to move from docker-compose to Kubernetes
    kubecolor # Colorize kubectl output
    kubectl
    kubectl-neat # Clean up Kubernetes yaml and json output to make it readable
    kubectx # Switch faster between clusters and namespaces in kubectl
    kubent # Easily check your clusters for use of deprecated APIs
    (wrapHelm kubernetes-helm {
      plugins = with kubernetes-helmPlugins; [
        helm-diff
        helm-secrets
      ];
    })
    kustomize
    rakkess # kubectl plugin to show an access matrix for server resources
    # skaffold # Easy and Repeatable Kubernetes Development
    stern # Multi pod and container log tailing for Kubernetes
    # tanka # Flexible, reusable and concise configuration for Kubernetes
  ];

  programs = {
    k9s = {
      enable = true;
      # From https://github.com/hmajid2301/dotfiles/blob/main/home-manager/programs/starship.nix
    };
  };
  catppuccin.k9s.enable = true;
}
