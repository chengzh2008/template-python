{
  description = "My Python Flake Shells";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/release-23.11"; };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-darwin";
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs;
          let
            devpython = pkgs.python311.withPackages
              (packages: with packages; [ virtualenv pip setuptools wheel build pytest ]);
          in
          [ devpython ];
        # somehow it only works with bash
        shellHook = ''
          echo "setting up alias for vritualenv..."
          alias vin="virtualenv .venv && source .venv/bin/activate"
          alias vout="deactivate"
          alias vclean="rm -rf .venv"
        '';
        C_INCLUDE_PATH = "${pkgs.rdkafka}/include/";
        LIBRARY_PATH = "${pkgs.rdkafka}/lib/";
        PYTHONDONTWRITEBYTECODE = 1;
      };
    };
}
