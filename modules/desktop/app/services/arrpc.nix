{pkgs, ...}: {
  hm = {
    services.arrpc = {
      enable = true;
      package = pkgs.master.arrpc;
      systemdTarget = "graphical-session.target";
    };
  };
}
