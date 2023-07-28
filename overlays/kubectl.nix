(final: prev: {
  kubernetes =
    (prev.kubernetes.override {
      buildGoModule = prev.buildGoModule;
    })
    .overrideAttrs (oldAttrs: rec {
      version = "1.24.16";
      src = prev.fetchFromGitHub {
        owner = "kubernetes";
        repo = "kubernetes";
        rev = "v${version}";
        hash = "sha256-rZtcCmDxpAN8zL4D0xGRC6yiEk65fHYADQjFN/HLLJU=";
      };
    });
})
