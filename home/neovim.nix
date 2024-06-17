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
      nodePackages.volar # Vuejs
      nodePackages.intelephense # PHP
      nodePackages.typescript-language-server # JavaScript / TypeScript
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
    text = "return " + lib.generators.toLua { } _prefs;
  };

  xdg.configFile."nvim/lua/colors.lua" = {
    text = "return " + lib.generators.toLua { } (lib.attrsets.filterAttrs (n: v: lib.strings.hasPrefix "base" n) config.lib.stylix.colors.withHashtag);
  };
}
