{lib, ...}: {
  programs.yazi.settings.yazi = {
    mgr = {
      ratio = [1 4 3];
      sort_by = "natural";
      sort_dir_first = true;
      show_hidden = true;
    };

    opener = {
      extract = [
        {
          run = "ouch d -y \"%*\"";
          desc = "Extract here with ouch";
          for = "windows";
        }
        {
          run = "ouch d -y \"$@\"";
          desc = "Extract here with ouch";
          for = "unix";
        }
      ];

      folder = [
        {
          run = "hyprctl dispatch exec \"[float; size 60% 60%; center 1] nemo\" \"$@\"";
          orphan = true;
          desc = "nemo";
          for = "linux";
        }
        {
          run = "fish -c \"nvim \\\"$1\\\"\"";
          block = true;
          desc = "neovim";
          for = "linux";
        }
        {
          run = "kitty --detach nvim \"$@\"";
          orphan = true;
          desc = "neovim (detached)";
          for = "linux";
        }
        {
          run = "fish -c \"lazygit -p \\\"$1\\\"\"";
          block = true;
          desc = "lazygit";
          for = "linux";
        }
        {
          run = "codium \"$@\"";
          orphan = true;
          desc = "vscodium";
          for = "linux";
        }
        {
          run = "kitty \"$@\"";
          orphan = true;
          desc = "kitty";
          for = "linux";
        }
        {
          run = "xdg-open \"$@\"";
          orphan = true;
          desc = "xdg-open";
          for = "linux";
        }
      ];

      text = [
        {
          run = "$EDITOR \"$@\"";
          block = true;
          desc = "$EDITOR";
          for = "linux";
        }
        {
          run = "nvim \"$@\"";
          block = true;
          desc = "neovim";
          for = "linux";
        }
        {
          run = "kitty --detach nvim \"$@\"";
          block = true;
          desc = "neovim (detached)";
          for = "linux";
        }
        {
          run = "codium \"$@\"";
          orphan = true;
          desc = "vscodium";
          for = "linux";
        }
        {
          run = "xdg-open \"$@\"";
          orphan = true;
          desc = "xdg-open";
          for = "linux";
        }
      ];

      document = [
        {
          run = "xdg-open \"$@\"";
          orphan = true;
          desc = "xdg-open";
          for = "linux";
        }
        {
          run = "zathura \"$@\"";
          orphan = true;
          desc = "zathura";
          for = "linux";
        }
        {
          run = "libreoffice \"$@\"";
          orphan = true;
          desc = "libreoffice";
          for = "linux";
        }
      ];

      image = [
        {
          run = "xdg-open \"$@\"";
          orphan = true;
          desc = "xdg-open";
          for = "linux";
        }
        {
          run = "qimgv \"$@\"";
          orphan = true;
          desc = "qimgv";
          for = "linux";
        }
        {
          run = "krita \"$@\"";
          orphan = true;
          desc = "krita";
          for = "linux";
        }
        {
          run = "satty --filename \"$@\"";
          orphan = true;
          desc = "satty";
          for = "linux";
        }
      ];

      video = [
        {
          run = "xdg-open \"$@\"";
          orphan = true;
          desc = "xdg-open";
          for = "linux";
        }
        {
          run = "mpv \"$@\"";
          orphan = true;
          desc = "mpv";
          for = "linux";
        }
      ];

      audio = [
        {
          run = "xdg-open \"$@\"";
          orphan = true;
          desc = "xdg-open";
          for = "linux";
        }
        {
          run = "mpv \"$@\"";
          orphan = true;
          desc = "mpv";
          for = "linux";
        }
      ];

      fallback = [
        {
          run = "xdg-open \"$@\"";
          orphan = true;
          desc = "xdg-open";
          for = "linux";
        }
      ];
    };

    open.rules = [
      {
        name = "*/";
        use = "folder";
      }
      {
        mime = "text/*";
        use = "text";
      }
      {
        mime = "image/*";
        use = "image";
      }
      {
        mime = "video/*";
        use = "video";
      }
      {
        mime = "application/octet-stream";
        use = "video";
      }
      {
        mime = "audio/*";
        use = "audio";
      }
      {
        mime = "inode/x-empty";
        use = "text";
      }
      {
        mime = "application/json";
        use = "text";
      }
      {
        mime = "application/zip";
        use = "ouch";
      }
      {
        mime = "application/gzip";
        use = "ouch";
      }
      {
        mime = "application/x-bzip";
        use = "ouch";
      }
      {
        mime = "application/x-bzip2";
        use = "ouch";
      }
      {
        mime = "application/x-tar";
        use = "ouch";
      }
      {
        mime = "application/x-7z-compressed";
        use = "archive";
      }
      {
        mime = "application/x-rar";
        use = "archive";
      }
      {
        mime = "application/pdf";
        use = "document";
      }
      {
        mime = "application/epub+zip";
        use = "document";
      }
      {
        mime = "application/x-mobipocket-ebook";
        use = "document";
      }
      {
        mime = "*";
        use = "fallback";
      }
    ];

    plugin.prepend_fetchers = [
      {
        id = "git";
        name = "*";
        run = "git";
      }
      {
        id = "git";
        name = "*/";
        run = "git";
      }
    ];

    plugin.prepend_previewers = [
      {
        mime = "application/*zip";
        run = "ouch";
      }
      {
        mime = "application/x-tar";
        run = "ouch";
      }
      {
        mime = "application/x-bzip2";
        run = "ouch";
      }
      {
        mime = "application/x-7z-compressed";
        run = "ouch";
      }
      {
        mime = "application/x-rar";
        run = "ouch";
      }
      {
        mime = "application/x-xz";
        run = "ouch";
      }
      {
        name = "*.csv";
        run = "rich-preview";
      }
      {
        name = "*.md";
        run = "rich-preview";
      }
      {
        name = "*.rst";
        run = "rich-preview";
      }
      {
        name = "*.ipynb";
        run = "rich-preview";
      }
      {
        name = "*.json";
        run = "rich-preview";
      }
    ];
  };
}
