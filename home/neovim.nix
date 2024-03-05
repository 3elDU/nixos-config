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
      rust-analyzer # Rust
      nodePackages.volar # Vuejs
      nodePackages.intelephense # PHP
      nodePackages.typescript-language-server # JavaScript / TypeScript
      tailwindcss-language-server # TailwindCSS
      gopls # Go
      vscode-langservers-extracted # HTML, JSON, CSS
      texlab # LaTeX
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
