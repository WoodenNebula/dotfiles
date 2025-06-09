vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- load project specific config file
local project_config = vim.fn.getcwd() .. "/.nvim/init.lua"
if vim.fn.filereadable(project_config) == 1 then
  dofile(project_config)
end
