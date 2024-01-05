{
  description = "My Python Flake Shells";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/release-23.11"; };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-darwin";
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      devShells.x86_64-darwin.python311 = pkgs.mkShell {
        nativeBuildInputs = with pkgs;
          let
            devpython = pkgs.python311.withPackages
              (packages: with packages; [ virtualenv pip setuptools wheel ]);
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
      };
    };
}
