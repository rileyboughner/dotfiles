{ config, pkgs, ...}: {
  services.immich.enable = true;
  services.immich.port = 2283;

  services.nginx.virtualHosts."pictures.clownweb.com" = {
  enableACME = true;
  forceSSL = true;
  locations."/" = {
    proxyPass = "http://[::1]:${toString config.services.immich.port}";
    proxyWebsockets = true;
    recommendedProxySettings = true;
    extraConfig = ''
      client_max_body_size 50000M;
      proxy_read_timeout   600s;
      proxy_send_timeout   600s;
      send_timeout         600s;
    '';
    };
  };
}
