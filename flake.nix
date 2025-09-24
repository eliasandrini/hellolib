{
  description = "hellolib derivation";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    hello_lib_overlay = final: prev: {
      hello_lib = final.callPackage ./default.nix {};
    };
    my_overlays = [ hello_lib_overlay ];
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ self.overlays.default ];
    };
  in
  {
    overlays.default = nixpkgs.lib.composeManyExtensions my_overlays;
    packages.${system}.default = pkgs.hello_lib;
    devShells.${system}.default = pkgs.mkShell {
      packages =
        with pkgs;
        [
          cmake
          hello_lib
        ];
    };
  };
}