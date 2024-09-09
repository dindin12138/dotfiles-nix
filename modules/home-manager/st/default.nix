{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      # ligatures dependency
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      configFile = writeText "config.def.h" (builtins.readFile ./config.h);
      patches = [
        ./patches/st-scrollback-ringbuffer-0.9.2.diff
      ];
    }))
  ];
}
