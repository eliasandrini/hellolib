{
  description = "part 3 hello app";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hellolib.url = "github:eliasandrini/";
  };

  outputs = { self, nixpkgs, hellolib }:
  let
      system = "x86_64-linux";
    helloPkg = hellolib.packages.${system}.default
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ hellolib.overlays.default ];
    };
  in
  {
    packages.${system}.default = pkgs.callPackage ./default.nix {hellolib = helloPkg};
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [ pkgs.cmake, helloPkg]
    }
  };
}