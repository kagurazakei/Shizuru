{
  lib,
  pkgs,
  ...
}: {
  hj.files = {
    ".config/yazi/package.toml" = {
      generator = pkgs.formats.toml {}.generate "yazi-package";
      value = {
        plugin.deps = [
          {
            use = "AnirudhG07/rich-preview";
            rev = "8be4d27";
            hash = "";
          }
          {
            use = "GianniBYoung/rsync";
            rev = "3f431aa";
            hash = "";
          }
          {
            use = "Rolv-Apneseth/starship";
            rev = "247f49d";
            hash = "";
          }
          {
            use = "dedukun/relative-motions";
            rev = "df97039";
            hash = "";
          }
          {
            use = "yazi-rs/plugins:full-border";
            rev = "864a021";
            hash = "1f3dad061209081a6b04dd6ff2cb06c7";
          }
          {
            use = "yazi-rs/plugins:git";
            rev = "864a021";
            hash = "e0ada736ea676c2bbb3ec705a49526ef";
          }
          {
            use = "imsi32/yatline-githead";
            rev = "f8f969e";
            hash = "4d441b38138ce6492a4e10fa349fd65";
          }
        ];
        flavor.deps = [];
      };
    };
  };
}
