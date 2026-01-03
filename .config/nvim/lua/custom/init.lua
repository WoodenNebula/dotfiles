vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.clipboard = "unnamedplus"

-- load project specific config file
local project_config = vim.fn.getcwd() .. "/.nvim/init.lua"
if vim.fn.filereadable(project_config) == 1 then
    dofile(project_config)
end

-- prolog file recognition
vim.cmd [[autocmd BufRead,BufNewFile *.pl set filetype=prolog]]
