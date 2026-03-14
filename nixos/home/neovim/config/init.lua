vim.cmd.colorscheme("gruvbox")
require("lualine").setup()

require("nvim-treesitter").install({ "nix", "lua" })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
