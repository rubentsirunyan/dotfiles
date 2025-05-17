# darwin-configuration.nix
# nix-darwin module: system properties, Homebrew, fonts, dock, defaults, and package installation
{ config, pkgs, lib, ... }:
let
  sharedPkgs = import ./shared-packages.nix { inherit pkgs; };
  macosPkgs  = import ./macos-packages.nix  { inherit pkgs; };
in
{
system.primaryUser = "ruben";
  # 1) Install packages
  environment.systemPackages = sharedPkgs ++ macosPkgs;

  # 2) Homebrew settings
  homebrew = {
    enable = true;
    brews  = [ "mas" ];
    casks  = [ "google-chrome" "todoist" "ghostty" ];
    onActivation = {
      cleanup    = "zap";
      autoUpdate = true;
      upgrade    = true;
    };
  };

  # 3) Fonts
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.inconsolata
  ];

  # 4) Dock configuration
  # 5) Global defaults
  system.defaults = {
    dock = {
      orientation     = "left";
      tilesize        = 32;
      persistent-apps = [
        "/System/Applications/Launchpad.app"
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

  # 6) Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # 7) Enable experimental features
  nix.settings.experimental-features = "nix-command flakes";

  # 8) System versioning
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
