{
  description = "Using sbcl + asdf + quicklisp for projects.";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/release-25.05";
    };
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    ...
  }@inputs: let
    inherit (self) outputs;

    forAllSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-darwin"
    ];
  in {
    devShells = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs.legacyPackages.${system};
      in {
        default = pkgs.mkShell {
          nativeBuildInputs = (with pkgs; [
          ]) ++ (with pkgs-unstable; [
            (sbcl.withPackages (ps: with ps; [
              sbclPackages.buildapp
            ]))
          ]);
        };
      }
    );
  };
}
