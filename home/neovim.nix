{ pkgs, config, lib, _prefs, ... }: {
  # Also install nvimpager
  home.packages = with pkgs; [
    nvimpager
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      # Required for treesitter
      gcc

      # --- Language servers ----
      nixd
      nixpkgs-fmt # Nix
      lua-language-server # Lua
      clang-tools # clangd, C/C++
      rust-analyzer # Rust
      vue-language-server # Vuejs
      nodePackages.intelephense # PHP
      typescript
      typescript-language-server # JavaScript / TypeScript
      tailwindcss-language-server # TailwindCSS
      gopls # Go
      vscode-langservers-extracted # HTML, JSON, CSS
      texlab # LaTeX

      # --- Debug tools ---
      gdb # C/C++/Rust
      vscode-extensions.vadimcn.vscode-lldb.adapter # C/C++/Rust
      delve # Go
    ];
  };

  xdg.configFile."nvim" = {
    source = ../configs/nvim;
    recursive = true;
  };

  # Write info about the current system
  # This is used to set up the Nix LSP
  xdg.configFile."nvim/lua/sysinfo.lua" = {
    text = "return " + lib.generators.toLua { } (
      _prefs // {
        # Provide path to typescript lib location
        # Used in vue language server setup
        typescriptLibPath = "${pkgs.typescript}/lib/node_modules/typescript/lib";
      }
    );
  };

  xdg.configFile."nvim/lua/colors.lua" = {
    text = "return " + lib.generators.toLua { } (lib.attrsets.filterAttrs (n: v: lib.strings.hasPrefix "base" n) config.lib.stylix.colors.withHashtag);
  };
}
