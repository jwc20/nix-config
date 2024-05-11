{ pkgs ? import <nixpkgs> {} }:
let
  rubyEnv = pkgs.bundlerEnv {
# 👆 built-in function to create a ruby environment from a gemset
    name = "env-proto";
    gemdir = ./.;
  # 👆 The directory that has a gemset.nix file
  };
in pkgs.mkShell {
  buildInputs = [
    rubyEnv
    rubyEnv.wrappedRuby
  # 👆 without wrappedRuby, the shell wouldn't contain the ruby binary
    nodejs
    yarn
  ];
}
