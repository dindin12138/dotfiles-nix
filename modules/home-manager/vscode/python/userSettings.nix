{ pkgs, ... }:
{
  "ruff.path" = [ "${pkgs.ruff}/bin/ruff" ];
  "[python]" = {
    "editor" = {
      "defaultFormatter" = "charliermarsh.ruff";
      "codeActionsOnSave" = {
        "source.organizeImports.ruff" = "explicit";
      };
    };
  };
  "jupyter.widgetScriptSources" = [
    "jsdelivr.com"
    "unpkg.com"
  ];
  "notebook.markup.fontSize" = 16;
}
