{ ...
}: {
  hm.services.cliphist = {
    enable = true;
    allowImages = true;
    systemdTargets = "graphical-session.target";
  };
}
