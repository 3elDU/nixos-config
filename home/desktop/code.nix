{ pkgs, inputs, _prefs, ... }: let
  extensions = inputs.nix-vscode-extensions.extensions.${_prefs.system};
in {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;

    extensions = with extensions.vscode-marketplace; [
      # -- language tools --
      vue.volar # Vue.js
      dart-code.dart-code # Dart
      dart-code.flutter # Flutter framework
      golang.go # Go
      rust-lang.rust-analyzer # Rust
      bradlc.vscode-tailwindcss # TailwindCSS

      # -- misc --
      yoavbls.pretty-ts-errors # Make TypeScript errors much better
      dbaeumer.vscode-eslint esbenp.prettier-vscode # ESLint / Prettier for JavaScript
      wakatime.vscode-wakatime # Time tracking with wakatime
      eamodio.gitlens # Better git UI

      # Vim emulation
      vscodevim.vim

      firefox-devtools.vscode-firefox-debug # debugger for firefox
    ];

    userSettings = {
      "window.menuBarVisibility" = "toggle";
      "editor.rulers" = [
        {
          "column" = 100;
        }
      ];
      "editor.inlayHints.enabled" = "onUnlessPressed";
      "editor.inlineSuggest.enabled" = true;
      "editor.fontLigatures" = "'ss01'";
      "editor.lineNumbers" = "relative";
      "editor.experimental.asyncTokenization" = true;
      "editor.tabSize" = 2;
      "editor.accessibilitySupport" = "off";
      "editor.autoClosingOvertype" = "always";
      "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
      "editor.unicodeHighlight.ambiguousCharacters" = false;
      "editor.unicodeHighlight.nonBasicASCII" = false;
      "editor.formatOnSave" = true;
      "editor.foldingImportsByDefault" = true;
      "editor.guides.bracketPairs" = "active";
      "prettier.printWidth" = 80;
      "[vue]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[dart]" = {
        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;
        "editor.rulers" = [80];
        "editor.selectionHighlight" = false;
        "editor.suggestSelection" = "first";
        "editor.tabCompletion" = "onlySnippets";
        "editor.wordBasedSuggestions" = "off";
      };
    };
  };

  home.packages = with pkgs; [
    godot_4
  ];
}
