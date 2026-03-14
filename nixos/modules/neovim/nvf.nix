{
  config,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings.vim = {
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };

      statusline.lualine.enable = true;
      autocomplete.nvim-cmp.enable = true;

      languages.nix.treesitter.enable = true;
      languages.nix.lsp.enable = true;
      languages.lua.treesitter.enable = true;
      languages.lua.lsp.enable = true;
      mini.indentscope.enable = true;
    };
  };
}
