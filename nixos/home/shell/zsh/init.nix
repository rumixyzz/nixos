{
    config,
    pkgs,
    ...
}:
{
    programs.zsh = {
        enable = true;
        oh-my-zsh = {
            enable = true;
            theme = "daveverwer";
            plugins = [ "git" "sudo" "aliases"];
        };
    };
}
