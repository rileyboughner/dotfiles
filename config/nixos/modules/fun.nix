{ config, pkgs, lib, ... }: 

{

environment.systemPackages = with pkgs; [
  asciiquarium
  cmatrix
  cbonsai
  sl
  libcaca
  cowsay
  no-more-secrets
  genact
];

}
