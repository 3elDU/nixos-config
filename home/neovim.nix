{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      # Required for treesitter
      gcc

      # --- Language servers ----
      nil # Nix
      lua-language-server # Lua
      clang-tools # clangd, C/C++
      nodePackages.volar # Vuejs
      nodePackages.intelephense # PHP
      nodePackages.typescript-language-server # JavaScript / TypeScript
      tailwindcss-language-server # TailwindCSS
      gopls # Go
      nodePackages.vscode-json-languageserver # JSON
    ];
  };
  home.packages = with pkgs; [
    # Use neovim as pager
    nvimpager
  ];

  xdg.configFile."nvim" = {
    source = ../configs/nvim;
    recursive = true;
  };
}
