# flake.nix
{
  description = "zenful nix-darwin system flake";

  inputs = {
    nixpkgs.url       = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url    = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url  = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, nix-homebrew }:
  let
    #–– your system config as a function
    configuration = { pkgs, lib, ... }: let
      # pinFromNixpkgs helper (you can remove if unused)
      pinFromNixpkgs = { packageName, rev, sha256, system ? "aarch64-darwin" }: 
        let
          url       = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
          pinnedPkgs = import (builtins.fetchTarball { inherit url sha256; }) { inherit system; };
        in
          pinnedPkgs.${packageName};

      pinnedPackages = [ /* … your pinned list … */ ];
    in {
      # 1) tell nix-darwin who “ruben” is and where their $HOME lives
      users.users.ruben = {
        home         = "/Users/ruben";
        # shell, extraGroups, etc. if you like
      };

      # 2) system-wide bits
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = (builtins.map (pkg: pinFromNixpkgs pkg) pinnedPackages) ++ [
        pkgs.stow
        pkgs.gnupg
        pkgs.postgresql_16
        pkgs.mkalias
        pkgs.raycast
        pkgs.tmux
        pkgs.neovim
        pkgs.asdf-vm
        pkgs.zoxide
        pkgs.starship
        pkgs.antidote
        pkgs.fzf
        pkgs.fzf-zsh
          pkgs.terminal-notifier
          pkgs.nmap
          pkgs.mtr
          pkgs.htop
          pkgs.watch
          pkgs.tree
          pkgs.wget
          pkgs.aerospace
      ];

      homebrew = {
        enable = true;
        brews  = [ "mas" ];
        casks  = [ "google-chrome" "todoist" "ghostty" ];
        onActivation.cleanup    = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade    = true;
      };

      fonts.packages = [
        pkgs.nerd-fonts.fira-code           # Fira Code + icons
        pkgs.nerd-fonts.jetbrains-mono      # JetBrains Mono + icons
        pkgs.nerd-fonts.hack                # Hack + icons
        pkgs.nerd-fonts.inconsolata         # Inconsolata + icons
      ];

      system.defaults = {
        dock = {
          orientation      = "left";
          tilesize         = 32;
          persistent-apps  = [
            "/System/Applications/Mail.app/"
            "/Applications/Google Chrome.app"
            "/Applications/Ghostty.app"
            "/Applications/Todoist.app"
            "/System/Applications/Calendar.app"
            "/System/Applications/System Settings.app"
          ];
        };
        finder = { FXPreferredViewStyle = "clmv"; };
        NSGlobalDomain = {
          AppleICUForce24HourTime = true;
          AppleInterfaceStyle     = "Dark";
          KeyRepeat               = 2;
          InitialKeyRepeat        = 15;
        };
      };

      nix.settings.experimental-features = "nix-command flakes";
      system.configurationRevision       = self.rev or self.dirtyRev or null;
      system.stateVersion                = 6;
      nixpkgs.hostPlatform               = "aarch64-darwin";
    };
  in {
    darwinConfigurations."macbook-pro-m" = nix-darwin.lib.darwinSystem {
      modules = [
        # ── 1) your system config
        configuration

        # ── 2) homebrew-on-darwin
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable       = true;
            enableRosetta = true;
            user         = "ruben";
          };
        }
      ];
    };
  };
}

