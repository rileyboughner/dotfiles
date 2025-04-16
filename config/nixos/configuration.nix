{ config, pkgs, ... }:

{
  imports = [  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # -- locale -- 
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # -- sound -- 
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # -- shell --
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      battery = "upower -i $(upower -e | grep 'BAT') | grep -E 'percentage'";
      fetch = "clear && fastfetch";
      n = "nvim";
      rebuild = "sudo nixos-rebuild switch --flake .#";
      link = "~/.dotfiles/scripts/set-symlinks";
      
      vpn-up = "sudo wg-quick up ~/.vpns/clownweb.conf";
      vpn-down = "sudo wg-quick down ~/.vpns/clownweb.conf";
      
      fart = "systemctl suspend";
      shart = "reboot";
      shit = "shutdown -h now";
    };
  };

  # for software engineering
  virtualisation.docker.enable = true;

  # -- packages --
  documentation.nixos.enable = false;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wireguard-tools
    git
    discord
    vscode
    pass
    tree
    firefox
    neovim
    brave
    kitty
    tldr
    ripgrep
    bat
    fd
    fzf
    pavucontrol
    fastfetch
    libreoffice
    bluetuith
  ];
  
  # -- system stuff --
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.stateVersion = "24.11";
}
