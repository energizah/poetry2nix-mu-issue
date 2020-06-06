{pkgs}:
let
  poetry2nix = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "poetry2nix";
    rev = "1cfaa4084d651d73af137866622e3d0699851008";
    sha256 = "sha256:16lp3z9w0m7sdxvbk252sx92b3jwf2122vskw0vkrfgym803y59s";
  }) { };

in
poetry2nix.mkPoetryApplication {
  projectDir = ./.;
  src = pkgs.fetchFromGitHub {
    owner = "mu-editor";
    repo = "mu";
    rev = "1.0.3";
    sha256 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
  };
  overrides = poetry2nix.overrides.withDefaults (self: super: {

  });
}
