{pkgs, ...}: {
  imports = [
    ../modules/home/cli/kubernetes.nix
  ];

  home = {
    packages = with pkgs; [
      # DevOps
      act # Run your GitHub Actions locally
      ansible # Radically simple IT automation platform
      awscli2 # Universal Command Line Interface for Amazon Web Services
      checkov # Static code analysis tool for infrastructure-as-code
      # colima # Container runtimes on macOS (and Linux) with minimal setup
      # ctop # Top-like interface for container metrics
      dive # A tool for exploring each layer in a docker image
      # docker
      # docker-compose
      hadolint # A smarter Dockerfile linter that helps you build best practice Docker images
      # infracost # Cloud cost estimates for Terraform in pull requests
      # lazydocker # The lazier way to manage everything docker
      # levant # An open source templating and deployment tool for HashiCorp Nomad jobs
      # nomad
      # podman # A program for managing pods, containers and container images
      # skopeo # Inspect container images and repositories on registries
      # terraform
      # terraform-docs # A utility to generate documentation from Terraform modules in various output formats
      # terraformer # CLI tool to generate terraform files from existing infrastructure (reverse Terraform)
      tflint # A Terraform linter focused on possible errors, best practices, etc
      vault
      vcluster # Create fully functional virtual kubernetes clusters

      # Cloud
      # aws-iam-authenticator # A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster
      # google-cloud-sdk
      # saml2aws # CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP
    ];
  };
}
