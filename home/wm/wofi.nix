{ pkgs, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      color = ../configs/wofi/colors;
      allow_images = true;
      insensitive = true;
      mode = "drun,run";
      term = "foot";
      image_size = 24;
      key_up = "Alt_L-k";
      key_down = "Alt_L-j";
      key_expand = "Alt_L-l";
    };
    style = 
    ''
        window {
          font-family: "JetBrainsMono Nerd Font Propo";
          font-size: 16px;

          background: rgba(--wofi-rgb-color2, 0.75);
          color: --wofi-color1;

          border-radius: 8px;
        }

        #outer-box {
          border: 2px solid --wofi-color0;
          border-radius: 8px;
        }

        /* Search bar */
        #input {
          padding: 8px 16px;
          border-radius: 0;
          border: none;
          border-bottom: 2px solid --wofi-color0;

          color: --wofi-color1;
          background: transparent;
        }
        #input:focus {
          color: --wofi-color2;
          background: --wofi-color0;
          font-weight: bold;
          box-shadow: none;
        }
        #input image {
          color: --wofi-color1;
          margin-right: 12px;
        }
        #input:focus image {
          color: --wofi-color2;
        }

        #inner-box {
          margin-top: 16px;
        }

        #entry {
          padding: 4px 16px;
        }
        #text {
          margin-left: 12px;
        }
        #img {
          margin-left: 8px;
        }
        #entry:selected {
          background: --wofi-color0;
          font-weight: bold;
        }

        expander#selected {
          background: transparent;
        }
        expander list {
          margin-top: 3px;
          padding: 4px;
          color: --wofi-color1;
          border-radius: 4px;
          background: --wofi-color2;
        }
        expander #entry {
          border-radius: 4px;
        }
    '';
  };
}
