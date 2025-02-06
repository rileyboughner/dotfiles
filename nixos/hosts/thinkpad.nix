{ confix, pkgs, ...}: 

{
  networking.hostName = "thinkpad";
  environment.systemPackages = with pkgs; [
    fastfetch
    cmatrix
  ];
}
