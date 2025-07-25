{lib, ...}: {
  programs.yazi.settings.keymap = {
    mgr = {
      prepend_keymap = [
        {
          on = ["m"];
          run = "plugin relative-motions";
          desc = "Trigger a new relative motion";
          prepend_keymap = [
            {
              on = ["l"];
              run = "plugin smart-enter";
              desc = "Enter the Child directory";
            }
            {
              on = ["<C-s>"];
              run = "shell \"$SHELL\" --block --confirm";
              desc = "Open shell here";
            }
            {
              on = ["c" "a"];
              run = "plugin compress";
              desc = "Archive selected files";
            }
            {
              on = "<C-u>";
              run = "seek -5";
              desc = "Seek up 5 units in the preview";
            }
            {
              on = "<C-d>";
              run = "seek 5";
              desc = "Seek down 5 units in the preview";
            }
            {
              on = "K";
              run = "arrow -50%";
              desc = "Move cursor up half page";
            }
            {
              on = "J";
              run = "arrow 50%";
              desc = "Move cursor down half page";
            }
            {
              on = "<A-k>";
              run = "arrow -5";
              desc = "Move cursor up half page";
            }
            {
              on = "<A-j>";
              run = "arrow 5";
              desc = "Move cursor down half page";
            }
            {
              on = ["f" "g"];
              run = "plugin fg";
              desc = "find file by content (fuzzy match)";
            }
            {
              on = ["f" "G"];
              run = "plugin fg --args='rg'";
              desc = "find file by content (ripgrep match)";
            }
            {
              on = ["f" "n"];
              run = "plugin fg --args='fzf'";
              desc = "find file by filename";
            }
            {
              on = ["f" "f"];
              run = "filter --smart";
              desc = "Filter files";
            }
            {
              on = ["f" "F"];
              run = "plugin smart-filter";
              desc = "Smart Filter";
            }
            {
              on = ["s"];
              run = "plugin searchjump";
              desc = "searchjump mode";
            }
            {
              on = "S";
              run = "search fd";
              desc = "Search files by name using fd";
            }
            {
              on = ["T"];
              run = "plugin --sync hide-preview";
              desc = "Hide or show the preview";
            }
            {
              on = ["y"];
              run = [
                "shell 'for path in \"$@\"; do echo \"file://$path\"; done | wl-copy -t text/uri-list' --confirm"
                "yank"
              ];
              desc = "yank files and copy to clipboard";
            }
            {
              on = "A";
              run = "create --dir";
              desc = "Create a dir";
            }
            {
              on = ["L"];
              run = "plugin ouch --args=zip";
              desc = "Compress with ouch";
            }
            {
              on = "R";
              run = "plugin rsync";
              desc = "Copy files using rsync";
            }
          ];
        }
      ];

      append_keymap = [
        {
          on = ["e"];
          run = "open";
          desc = "Open the selected files";
        }
        {
          on = ["E"];
          run = "open --interactive";
          desc = "Open the selected files interactively";
        }
        {
          on = ["g" "n"];
          run = "cd ~/.config/nvim/";
          desc = "Go to the nvim directory";
        }
        {
          on = ["g" "v"];
          run = "cd ~/videos/";
          desc = "Go to the videos directory";
        }
        {
          on = ["g" "p"];
          run = "cd ~/pictures/";
          desc = "Go to the pictures directory";
        }
        {
          on = ["g" "s"];
          run = "cd ~/pictures/screenshots/";
          desc = "Go to the screenshots directory";
        }
        {
          on = ["g" "D"];
          run = "cd ~/documents/";
          desc = "Go to the docs directory";
        }
        {
          on = ["g" "o"];
          run = "cd ~/documents/obsidian-vaults";
          desc = "Go to the obsidian directory";
        }
        {
          on = ["g" "e"];
          run = "cd ~/dev/";
          desc = "Go to the dev directory";
        }
      ];
    };

    input.prepend_keymap = [
      {
        on = ["<Esc>"];
        run = "close";
        desc = "Cancel input";
      }
    ];

    completion.prepend_keymap = [
      {
        on = "<C-k>";
        run = "arrow -1";
        desc = "Move cursor up";
      }
      {
        on = "<C-j>";
        run = "arrow 1";
        desc = "Move cursor down";
      }
    ];
  };
}
