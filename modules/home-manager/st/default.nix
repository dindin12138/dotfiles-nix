{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      configFile = writeText "config.def.h" (builtins.readFile ./config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      patches = [
        ./patches/st-scrollback-ringbuffer-0.9.2.diff
        ./patches/st-ligatures-scrollback-ringbuffer-20240427-0.9.2.diff
        ./patches/st-desktopentry-0.8.5.diff
      ];
    }))
  ];
}
