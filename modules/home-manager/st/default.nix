{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      configFile = writeText "config.def.h" (builtins.readFile ./config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
      patches = [
        ./patches/st-scrollback-ringbuffer-0.9.2.diff
      ];
    }))
  ];
}
