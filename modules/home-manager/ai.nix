{ config, ... }:
{
  programs.claude-code = {
    enable = true;
    enableMcpIntegration = true;
    settings = {
      theme = "dark";
      # model = "claude-3-5-sonnet-20241022";
      permissions = {
        defaultMode = "ask";
        allow = [
          "Bash(git diff:*)"
          "Bash(git status:*)"
          "Edit"
          "Read"
        ];
        ask = [
          "Bash(git push:*)"
          "Bash(npm install:*)"
        ];
        deny = [
          "Read(./.env)"
          "Read(./secrets/**)"
        ];
      };
    };
    rules = { };
    commands = { };
    lspServers = {
      clangd = {
        command = "clangd";
        args = [
          "--background-index"
        ];
        extensionToLanguage = {
          ".c" = "c";
          ".cpp" = "cpp";
          ".cc" = "cpp";
          ".cxx" = "cpp";
          ".h" = "c";
          ".hpp" = "cpp";
        };
      };
    };
  };

  programs.gemini-cli = {
    enable = true;
    settings = {
      theme = "Dark";
      vimMode = true;
      preferredEditor = "nvim";
      autoAccept = false;
    };
  };

  programs.mcp = {
    enable = true;
    servers = {
      filesystem = {
        command = "npx";
        args = [
          "-y"
          "@modelcontextprotocol/server-filesystem"
          "${config.home.homeDirectory}/Workspace"
        ];
      };
    };
  };
}
