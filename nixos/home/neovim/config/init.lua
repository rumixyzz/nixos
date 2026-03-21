vim.cmd.colorscheme("retrobox")
vim.opt.tgc = true;
vim.opt.bg  = "dark";
vim.opt.cb  = "unnamedplus";
vim.opt.nu  = true;
vim.opt.rnu = true;
vim.opt.fcs = { eob = " " };
vim.opt.sw  = 4;
vim.opt.et  = true;
vim.opt.ai  = true;
vim.opt.si  = true;
vim.opt.hls = false;

require("gruvbox").setup({transparent_mode = true})
vim.cmd.color("gruvbox")

require("nvim-treesitter").setup()

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'nix', 'python' },
  callback = function() vim.treesitter.start() end,
})
