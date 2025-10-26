{ config, ... }:
''
  /* -----------------------------------------------------
  * Import colors 
  * ----------------------------------------------------- */

  @define-color color0 #${config.lib.stylix.colors.base00}; /* Catppuccin base00 (base) */
  @define-color color1 #${config.lib.stylix.colors.base02}; /* Catppuccin base02 (surface0) */
  @define-color color2 #${config.lib.stylix.colors.base05}; /* Catppuccin base05 (text) */
  @define-color color3 #${config.lib.stylix.colors.base0D}; /* Catppuccin base0D (blue) */
  @define-color color4 #${config.lib.stylix.colors.base08}; /* Catppuccin base08 (red) */
  @define-color color5 #${config.lib.stylix.colors.base0E}; /* Catppuccin base0E (mauve) */

  /** ********** Fonts ********** **/
  * {
    font-family: ${config.stylix.fonts.monospace.name};
    font-size: ${toString (config.stylix.fonts.sizes.popups + 2)}px;
  }

  #window {
    background-color: @color0;
    color: @color2;
    border: 2px solid @color1;
    border-radius: 0px;
  }

  #outer-box {
    padding: 20px;
  }

  #input {
    background-color: @color1;
    border: 0px solid @color3;
    padding: 8px 12px;
  }

  #scroll {
    margin-top: 20px;
  }

  #inner-box {
  }

  #img {
    padding-right: 8px;
  }

  #text {
    color: @color2;
  }

  #text:selected {
    color: @color0;
  }

  #entry {
    padding: 6px;
  }

  #entry:selected {
    background-color: @color3;
    color: @color0;
  }

  #unselected {
  }

  #selected {
  }

  #input,
  #entry:selected {
    border-radius: 4px;
  }
''
