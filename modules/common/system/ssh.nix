{config, ...}: {
  hj.files.".ssh/config".text = ''
    Host github.com
      HostName github.com
      User git
      IdentityFile ${config.sops.secrets."github-ssh".path}
      IdentitiesOnly yes
      AddKeysToAgent yes
      PreferredAuthentications publickey

    Host codeberg.org
      HostName codeberg.org
      User git
      IdentityFile ${config.sops.secrets."codeberg-ssh".path}
      IdentitiesOnly yes
      AddKeysToAgent yes
      PreferredAuthentications publickey

    Host gitlab.com
      HostName gitlab.com
      User git
      IdentityFile ${config.sops.secrets."gitlab-ssh".path}
      IdentitiesOnly yes
      AddKeysToAgent yes
      PreferredAuthentications publickey
  '';
}
