let
    pkgs = (import (builtins.fetchTarball {
        # nixOs 23.11 (2024-04-06)
        url = "https://github.com/NixOS/nixpkgs/archive/e38d7cb66ea4f7a0eb6681920615dfcc30fc2920.tar.gz";
        sha256 = "1shml3mf52smfra0x3mpfixddr4krp3n78fc2sv07ghiphn22k43";
    }) { });

    stdenv = pkgs.stdenv;

in pkgs.mkShell rec {
    name = "nix-shell";
    shellHook = ''
        source .bashrc
        echo "THIS IS A NIX SHELL!" | ${pkgs.cowsay}/bin/cowsay | ${pkgs.lolcat}/bin/lolcat
    '';

    COLOR = "blue";

    # PASSWORD = import ./password.nix;

    buildInputs = (with pkgs; [
        bashInteractive
        curl
        gnugrep
        nix-prefetch-scripts
        tree
        which
        (pkgs.python38.buildEnv.override {
            ignoreCollisions = true;
            extraLibs = with pkgs.python38.pkgs; [
            pprintpp
            ];
        })
    ]);
}
