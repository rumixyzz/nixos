{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.email = "mailark@cock.li";
      user.name = "Ahamed Rumi";
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
  };
}
