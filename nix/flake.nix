{
  description = "Unified flake: Ubuntu packages + macOS nix-darwin";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin }: let
    # Static imports per platform
    pkgsLinux  = import nixpkgs { system = "x86_64-linux"; config = { allowUnfree = true; }; };
    pkgsDarwin = import nixpkgs { system = "aarch64-darwin"; config = { allowUnfree = true; }; };

    # Shared & OS-specific packages
    sharedLinux    = import ./shared-packages.nix { pkgs = pkgsLinux; };
    ubuntuSpecific = import ./ubuntu-packages.nix { pkgs = pkgsLinux; };
    sharedDarwin   = import ./shared-packages.nix { pkgs = pkgsDarwin; };
    macosSpecific  = import ./macos-packages.nix { pkgs = pkgsDarwin; };

    # nix-darwin system module
    darwinConfigMod = import ./darwin-configuration.nix {
      pkgs = pkgsDarwin;
      lib  = pkgsDarwin.lib;
    };
  in
  {
    # Ubuntu profile (install with `nix profile install --flake .#packagesDefault`)
    packagesDefault = pkgsLinux.buildEnv {
      name  = "my-ubuntu-profile";
      paths = sharedLinux ++ ubuntuSpecific;
    };

    # macOS system (rebuild with `darwin-rebuild switch --flake .#mac`)
    darwinConfigurations."macbook-pro-m" = nix-darwin.lib.darwinSystem {
      system  = "aarch64-darwin";
      pkgs    = pkgsDarwin;
      modules = [ ./darwin-configuration.nix ];
    };
  };
}
