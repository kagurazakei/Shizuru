{pkgs, ...}: {
  hj.packages = [pkgs.atuin];
  hj.files = {
    ".config/atuin/config.toml".text = ''
      dialect = "us"
       timezone = "local"
       auto_sync = true
       update_check = true
       sync_frequency = "30m"
       search_mode = "fuzzy"
       filter_mode = "global"
       workspaces = false
       filter_mode_shell_up_key_binding = "global"
       search_mode_shell_up_key_binding = "fuzzy"
       style = "full"
       show_preview = true
       enter_accept = true
       local_timeout = 20
       [stats]
       [keys]
       [sync]
       records = true
       [preview]
       [daemon]
    '';
  };
}
