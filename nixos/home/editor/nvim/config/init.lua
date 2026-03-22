vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'nix','lua','c','python','bash' },
  callback = function() vim.treesitter.start() end,
})

vim.cmd.colorscheme("solarized-osaka")
require("lualine").setup()

vim.opt.nu = true;
vim.opt.rnu = true;
vim.opt.fcs = { eob = " " };
vim.opt.ai = true;
vim.opt.si = true;
vim.opt.et = true;
vim.opt.sw = 4;
vim.opt.ts = 4;
vim.opt.hls = false;
vim.opt.cul = true;
