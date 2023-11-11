{
  config,
  agenix,
  mystash,
  ...
}: {
  imports = [
    agenix.homeManagerModules.default
  ];

  age.identityPaths = [
    "${config.home.homeDirectory}/.ssh/id_ed25519-agenix" # main-agenix
  ];

  age.secrets = {
    "aws.config" = {
      path = "${config.home.homeDirectory}/.aws/config";
      file = "${mystash}/aws.config.age";
    };
    "aws.credentials" = {
      path = "${config.home.homeDirectory}/.aws/credentials";
      file = "${mystash}/aws.credentials.age";
    };
  };
}
