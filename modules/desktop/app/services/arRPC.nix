{pkgs, ...}: {
  hj.packages = [pkgs.master.arrpc];

  systemd.user.services.arrpc = {
    description = "arRPC Discord Rich Presence";
    after = ["network.target"];
    wantedBy = ["graphical-session.target"];
    serviceConfig = {
      ExecStart = "${pkgs.master.arrpc}/bin/arrpc";
      Restart = "on-failure";
    };
  };
}
