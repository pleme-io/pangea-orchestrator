{
  description = "orchestrator library";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  inputs.ruby-nix.url = "github:inscapist/ruby-nix";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.devenv = {
    url = "github:cachix/devenv";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    ruby-nix,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ruby-nix.overlays.ruby];
      };
      rnix = ruby-nix.lib pkgs;
      rnix-env = rnix {
        name = "pangea-orchestrator";
        gemset = ./gemset.nix;
      };
      env = rnix-env.env;
      ruby = rnix-env.ruby;
    in {
      devShells = rec {
        default = dev;
        dev = pkgs.mkShell {
          buildInputs = with pkgs; [
            env
            ruby
            opentofu
          ];
          shellHook = ''
            PATH=$PWD/bin:$PATH
          '';
        };
      };
    });
}
