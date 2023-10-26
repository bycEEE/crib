{pkgs, ...}:
/*
home-manager configuration
Useful links:
- Home Manager Manual: https://nix-community.gitlab.io/home-manager/
- Appendix A. Configuration Options: https://nix-community.gitlab.io/home-manager/options.html
*/
{
  home = {
    packages = with pkgs; [
      # DevOps
      act # Run your GitHub Actions locally
      ansible # Radically simple IT automation platform
      chart-testing # CLI tool for linting and testing Helm charts
      # colima # Container runtimes on macOS (and Linux) with minimal setup
      # dive # A tool for exploring each layer in a docker image
      docker
      docker-compose
      # hadolint # A smarter Dockerfile linter that helps you build best practice Docker images
      helm-docs # Generate documentation from Kubernetes Helm charts
      helmfile
      # infracost # Cloud cost estimates for Terraform in pull requests
      k9s # Kubernetes CLI To Manage Your Clusters In Style!
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
      # levant # An open source templating and deployment tool for HashiCorp Nomad jobs
      # nomad
      # podman # A program for managing pods, containers and container images
      # skaffold # Easy and Repeatable Kubernetes Development
      # skopeo # Inspect container images and repositories on registries
      stern # Multi pod and container log tailing for Kubernetes
      # tanka # Flexible, reusable and concise configuration for Kubernetes
      # terraform
      # terraform-docs # A utility to generate documentation from Terraform modules in various output formats
      # terraformer # CLI tool to generate terraform files from existing infrastructure (reverse Terraform)
      tflint # A Terraform linter focused on possible errors, best practices, etc
      vault

      # Cloud
      # aws-iam-authenticator # A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster
      # awscli2
      eksctl
      # google-cloud-sdk
      # saml2aws # CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP
    ];
  };
}
