{ pkgs, ... }:
{
  version = "2.0.0";
  tasks = [
    {
      label = "cmake";
      type = "shell";
      command = "${pkgs.cmake}/bin/cmake";
      args = [
        "-B build"
      ];
    }
    {
      label = "make";
      options = {
        cwd = "\${workspaceFolder}/build";
      };
      group = {
        kind = "build";
        isDefault = true;
      };
      command = "${pkgs.gnumake}/bin/make";
      args = [ ];
    }
    {
      label = "cmake & make compile";
      dependsOrder = "sequence";
      dependsOn = [
        "cmake"
        "make"
      ];
    }
    {
      label = "clang single file compile";
      type = "process";
      command = "${pkgs.clang}/bin/clang++";
      args = [
        "\${file}"
        "-g"
        "-Wall"
        # "-stdlib=libc++"
        "-std=c++11"
        "-o"
        "\${workspaceFolder}/build/\${fileBasenameNoExtension}"
      ];
      group = {
        kind = "build";
        isDefault = true;
      };
      options = {
        cwd = "\${fileDirname}";
      };
      presentation = {
        echo = true;
        reveal = "always";
        focus = false;
        panel = "shared";
      };
    }
  ];
}

