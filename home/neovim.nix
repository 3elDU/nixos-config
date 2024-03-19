{ pkgs, ... }: {
  programs.neovim = {
    # Use nightly neovim from overlay
    package = pkgs.neovim-nightly;

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
}
