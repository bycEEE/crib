{...}: {
  programs.helix = {
    enable = true;
    # package = inputs.helix.packages.${pkgs.system}.default.overrideAttrs (self: {
    #   makeWrapperArgs = with pkgs;
    #     self.makeWrapperArgs
    #     or []
    #     ++ [
    #       "--suffix"
    #       "PATH"
    #       ":"
    #       (lib.makeBinPath [
    #         clang-tools
    #         marksman
    #         nil
    #         nodePackages.bash-language-server
    #         nodePackages.vscode-css-languageserver-bin
    #         nodePackages.vscode-langservers-extracted
    #         shellcheck
    #       ])
    #     ];
    # });
    settings = {
      theme = "catppuccin_macchiato";

      editor = {
        color-modes = true;
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
          rainbow-option = "dim";
        };
        lsp.display-inlay-hints = true;
        statusline.center = ["position-percentage"];
        true-color = true;
        whitespace.characters = {
          newline = "↴";
          tab = "⇥";
        };
      };

      # languages = {
      #   language = let
      #     prettier = lang: {
      #       command = "${pkgs.nodePackages.prettier}/bin/prettier";
      #       args = ["--parser" lang];
      #     };
      #     prettierLangs = map (e: {
      #       name = e;
      #       formatter = prettier e;
      #     });
      #     langs = ["css" "scss" "json" "html"];
      #   in
      #     [
      #       {
      #         name = "bash";
      #         auto-format = true;
      #         formatter = {
      #           command = "${pkgs.shfmt}/bin/shfmt";
      #           args = ["-i" "2"];
      #         };
      #       }
      #       {
      #         name = "clojure";
      #         injection-regex = "(clojure|clj|edn|boot|yuck)";
      #         file-types = ["clj" "cljs" "cljc" "clje" "cljr" "cljx" "edn" "boot" "yuck"];
      #       }
      #     ]
      #     ++ prettierLangs langs;

      #   language-server = {
      #     bash-language-server = {
      #       command = "${pkgs.nodePackages.bash-language-server}/bin/bash-language-server";
      #       args = ["start"];
      #     };

      #     clangd = {
      #       command = "${pkgs.clang-tools}/bin/clangd";
      #       clangd.fallbackFlags = ["-std=c++2b"];
      #     };

      #     nil = {
      #       command = lib.getExe pkgs.nil;
      #       config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      #     };

      #     vscode-css-language-server = {
      #       command = "${pkgs.nodePackages.vscode-css-languageserver-bin}/bin/css-languageserver";
      #       args = ["--stdio"];
      #       config = {
      #         provideFormatter = true;
      #         css.validate.enable = true;
      #       };
      #     };
      #   };
      # };

      # vim-like key bindings from https://github.com/LGUG2Z/helix-vim/blob/master/config.toml
      keys.normal = {
        # Quick iteration on config changes
        C-o = ":config-open";
        C-r = ":config-reload";

        # Some nice Helix stuff
        C-h = "select_prev_sibling";
        C-j = "shrink_selection";
        C-k = "expand_selection";
        C-l = "select_next_sibling";

        # Personal preference
        # o = ["open_below" "normal_mode"];
        # O = ["open_above" "normal_mode"];

        # Muscle memory
        "{" = ["goto_prev_paragraph" "collapse_selection"];
        "}" = ["goto_next_paragraph" "collapse_selection"];
        "0" = "goto_line_start";
        "$" = "goto_line_end";
        "^" = "goto_first_nonwhitespace";
        G = "goto_file_end";
        "%" = "match_brackets";
        V = ["select_mode" "extend_to_line_bounds"];
        C = ["extend_to_line_end" "yank_main_selection_to_clipboard" "delete_selection" "insert_mode"];
        D = ["extend_to_line_end" "yank_main_selection_to_clipboard" "delete_selection"];
        S = "surround_add"; # Would be nice to be able to do something after this but it isn't chainable

        # Clipboards over registers ye ye
        x = "delete_selection";
        p = ["paste_clipboard_after" "collapse_selection"];
        P = ["paste_clipboard_before" "collapse_selection"];
        # Would be nice to add ya and yi, but the surround commands can't be chained
        Y = ["extend_to_line_end" "yank_main_selection_to_clipboard" "collapse_selection"];

        # Uncanny valley stuff, this makes w and b behave as they do Vim
        w = ["move_next_word_start" "move_char_right" "collapse_selection"];
        W = ["move_next_long_word_start" "move_char_right" "collapse_selection"];
        e = ["move_next_word_end" "collapse_selection"];
        E = ["move_next_long_word_end" "collapse_selection"];
        b = ["move_prev_word_start" "collapse_selection"];
        B = ["move_prev_long_word_start" "collapse_selection"];

        # If you want to keep the selection-while-moving behaviour of Helix, this two lines will help a lot,
        # especially if you find having text remain selected while you have switched to insert or append mode
        #
        # There is no real difference if you have overridden the commands bound to 'w', 'e' and 'b' like above
        # But if you really want to get familiar with the Helix way of selecting-while-moving, comment the
        # bindings for 'w', 'e', and 'b' out and leave the bindings for 'i' and 'a' active below. A world of difference!
        i = ["insert_mode" "collapse_selection"];
        a = ["append_mode" "collapse_selection"];

        # Undoing the 'd' + motion commands restores the selection which is annoying
        u = ["undo" "collapse_selection"];

        # Escape the madness! No more fighting with the cursor! Or with multiple cursors!
        esc = ["collapse_selection" "keep_primary_selection"];

        # Search for word under cursor
        "*" = ["move_char_right" "move_prev_word_start" "move_next_word_end" "search_selection" "search_next"];
        "#" = ["move_char_right" "move_prev_word_start" "move_next_word_end" "search_selection" "search_prev"];

        # Make j and k behave as they do Vim when soft-wrap is enabled
        j = "move_line_down";
        k = "move_line_up";
      };

      # Extend and select commands that expect a manual input can't be chained
      # I've kept d[X]; commands here because it's better to at least have the stuff you want to delete
      # selected so that it's just a keystroke away to delete
      keys.normal.d = {
        d = ["extend_to_line_bounds" "yank_main_selection_to_clipboard" "delete_selection"];
        t = ["extend_till_char"];
        s = ["surround_delete"];
        i = ["select_textobject_inner"];
        a = ["select_textobject_around"];
        j = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
        down = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
        k = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
        up = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
        G = ["select_mode" "extend_to_line_bounds" "goto_last_line" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
        w = ["move_next_word_start" "yank_main_selection_to_clipboard" "delete_selection"];
        W = ["move_next_long_word_start" "yank_main_selection_to_clipboard" "delete_selection"];
        g = {g = ["select_mode" "extend_to_line_bounds" "goto_file_start" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];};
      };

      keys.normal.y = {
        y = ["extend_to_line_bounds" "yank_main_selection_to_clipboard" "normal_mode" "collapse_selection"];
        j = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
        down = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
        k = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
        up = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
        G = ["select_mode" "extend_to_line_bounds" "goto_last_line" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
        w = ["move_next_word_start" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
        W = ["move_next_long_word_start" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
        g = {g = ["select_mode" "extend_to_line_bounds" "goto_file_start" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];};
      };

      keys.insert = {
        # Escape the madness! No more fighting with the cursor! Or with multiple cursors!
        esc = ["collapse_selection" "normal_mode"];
      };

      keys.select = {
        # Muscle memory
        "{" = ["extend_to_line_bounds" "goto_prev_paragraph"];
        "}" = ["extend_to_line_bounds" "goto_next_paragraph"];
        "0" = "goto_line_start";
        "$" = "goto_line_end";
        "^" = "goto_first_nonwhitespace";
        G = "goto_file_end";
        D = ["extend_to_line_bounds" "delete_selection" "normal_mode"];
        C = ["goto_line_start" "extend_to_line_bounds" "change_selection"];
        "%" = "match_brackets";
        S = "surround_add"; # Basically 99% of what I use vim-surround for
        u = ["switch_to_lowercase" "collapse_selection" "normal_mode"];
        U = ["switch_to_uppercase" "collapse_selection" "normal_mode"];

        # Visual-mode specific muscle memory
        i = "select_textobject_inner";
        a = "select_textobject_around";

        # Some extra binds to allow us to insert/append in select mode because it's nice with multiple cursors
        tab = ["insert_mode" "collapse_selection"]; # tab is read by most terminal editors as "C-i"
        C-a = ["append_mode" "collapse_selection"];

        # Make selecting lines in visual mode behave sensibly
        k = ["extend_line_up" "extend_to_line_bounds"];
        j = ["extend_line_down" "extend_to_line_bounds"];

        # Clipboards over registers ye ye
        d = ["yank_main_selection_to_clipboard" "delete_selection"];
        x = ["yank_main_selection_to_clipboard" "delete_selection"];
        y = ["yank_main_selection_to_clipboard" "normal_mode" "flip_selections" "collapse_selection"];
        Y = ["extend_to_line_bounds" "yank_main_selection_to_clipboard" "goto_line_start" "collapse_selection" "normal_mode"];
        p = "replace_selections_with_clipboard"; # No life without this
        P = "paste_clipboard_before";

        # Escape the madness! No more fighting with the cursor! Or with multiple cursors!
        esc = ["collapse_selection" "keep_primary_selection" "normal_mode"];
      };
    };
  };
}
