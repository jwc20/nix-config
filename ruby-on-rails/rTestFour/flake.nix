{
  description = "Rails 7 dev environment";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in with pkgs; {
        devShells.default = pkgs.mkShell {
          packages = [ ruby_3_2 postgresql_14 redis ];
          shellHook = ''
            export PGDATA=$PWD/.pgdata

            # Initialize MySQL data directory
            if [ ! -d "$PGDATA" ]; then
              initdb $PGDATA
            fi
          '';
        };
      });
}