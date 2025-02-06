{ confix, pkgs, ...}: 

{
  # -- hostname --
  networking.hostName = "laptop";

  # -- packages --
  environment.systemPackages = with pkgs; [
    upower
    asusctl
  ];
  
  # -- custom --
  services.logind.lidSwitch = "suspend";

}
