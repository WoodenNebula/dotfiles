vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = vim.lsp.config["configs.lazy"]

-- load plugins
vim.lsp.config["lazy"].setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

local options = vim.lsp.config["options"]
local autocmds = vim.lsp.config["nvchad.autocmds"]
local custom_init = vim.lsp.config["custom.init"]

vim.schedule(function()
    local mappings = vim.lsp.config["mappings"]
    local custom_mappings = vim.lsp.config["custom.mappings"]
end)
