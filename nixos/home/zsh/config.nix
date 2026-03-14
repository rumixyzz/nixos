{
  config,
  pkgs,
  ...
}: {
  programs.eza.enable = true;
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "eza --icons=always";
      la = "ls -la";
    };
    #    initContent = "
    #      autoload -Uz colors && colors
    #      PROMPT=\"%F{red}[%f%F{yellow}%n%f%F{green}@%f%F{blue}%m%f %F{magenta}%~%f%F{red}]%f%F{cyan}$%f \"
    #    ";

    prezto = {
      enable = true;
      prompt.theme = "sorin";
      syntaxHighlighting = {
        highlighters = ["main" "brackets" "pattern" "line" "cursor" "root"];
      };
    };
    initContent = "
      export VISUAL=\"nvim\"
    ";
  };
}
