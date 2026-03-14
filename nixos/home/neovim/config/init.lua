local o = vim.opt
o.nu = true;
o.rnu = true;
o.fcs = { eob = " " };
o.tgc = true;

vim.cmd.colorscheme("gruvbox")
require("mini.statusline").setup()
