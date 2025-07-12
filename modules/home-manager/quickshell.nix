{ pkgs, ... }: {

  programs.quickshell = {
    enable = true;
    activeConfig = null;
  };
  home.packages = with pkgs; [
    # kdePackages.qt6ct
    kdePackages.qt5compat
    kdePackages.qtbase
    kdePackages.qtdeclarative
    kdePackages.qtimageformats
    kdePackages.qtmultimedia
    kdePackages.qtpositioning
    kdePackages.qtquicktimeline
    kdePackages.qtsensors
    kdePackages.qtsvg
    kdePackages.qttools
    kdePackages.qttranslations
    kdePackages.qtvirtualkeyboard
    kdePackages.qtwayland
    kdePackages.qt5compat
    kdePackages.syntax-highlighting

    libsForQt5.kdialog
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
