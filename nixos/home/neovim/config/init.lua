vim.cmd.colorscheme("gruvbox")
require("lualine").setup()

require("nvim-treesitter").install({ "nix", "lua" })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

vim.opt.nu = true;
vim.opt.rnu = true;
vim.opt.fcs = { eob = " " };
vim.opt.cb = "unnamedplus";
