let
  pkgs = (
    import (builtins.fetchTarball {
      name = "nixos-23.11-stable-20240406";
      url = "https://github.com/NixOS/nixpkgs/archive/e38d7cb66ea4f7a0eb6681920615dfcc30fc2920.tar.gz";
      sha256 = "1shml3mf52smfra0x3mpfixddr4krp3n78fc2sv07ghiphn22k43";
    }) { }
  );
  stdenv = pkgs.stdenv;
in
pkgs.mkShell rec {
  name = "rails-nix";

  shellHook = ''
    source .bashrc
    export GEM_HOME=$(pwd)/.gems
    export PATH=$GEM_HOME/bin:$PATH
    bundle install
  '';

  buildInputs = (
    with pkgs;
    [
      bashInteractive
      ruby
      rubyPackages_3_1.rails
      nodejs
      bundler
    ]
  );
}
