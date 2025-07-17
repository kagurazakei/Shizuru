{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    libnotify
    sound-theme-freedesktop
  ];

  systemd.services."nixos-rebuild@" = {
    description = "Post-rebuild notification for nixos-rebuild %I";
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      ExecStart =
        let
          notify = "${pkgs.libnotify}/bin/notify-send";
          sound = "${pkgs.sound-theme-freedesktop}/bin/canberra-gtk-play";
        in
        pkgs.writeShellScript "rebuild-notify" ''
          if [[ "%I" == *switch* ]]; then
            ${notify} -i nix-snowflake "NixOS Rebuild" "System configuration applied successfully!"
            ${sound} -d complete
          fi
        '';
    };
  };

  systemd.user.services."nixos-rebuild-notify" = {
    unitConfig = {
      After = "nixos-rebuild.service";
      Requires = "nixos-rebuild.service";
    };
    serviceConfig = {
      ExecStart = "${pkgs.systemd}/bin/systemctl start nixos-rebuild@%i.service";
      RemainAfterExit = true;
      Type = "oneshot";
    };
    wantedBy = [ "default.target" ];
  };
}
