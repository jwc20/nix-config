{ project_dir ? (toString ./.)
, pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    bundler
    bundler.ruby
    zlib
    postgresql
    nodejs
    yarn
    nixops_unstable_minimal
  ];
}
