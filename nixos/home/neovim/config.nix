{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      nvim-treesitter
      lualine-nvim
    ];
  };
  
  xdg.configFile."nvim".source = ./config;
}
