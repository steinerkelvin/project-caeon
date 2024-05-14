{
  description = "Caeon Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
    vscoq.url = "github:coq-community/vscoq";
  };

  outputs = { self, nixpkgs, flake-utils, vscoq }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells = rec {
          default = pkgs.mkShell {
            # Development tools
            packages = [
              pkgs.coq_8_18
              pkgs.coqPackages.coqide
              vscoq.packages.${system}.vscoq-language-server-coq-8-18
              pkgs.gnumake
            ];
          };
        };
      }
    );
}
