{ pkgs
, ...
}: {
  hj = {
    packages = [ pkgs.zoxide ];
  };
}
