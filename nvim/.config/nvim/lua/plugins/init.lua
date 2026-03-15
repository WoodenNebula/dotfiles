return {
    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
        end,
    },
    {
        "stevearc/conform.nvim",
        lazy = false,
        cmd = { "ConformInfo" },
        opts = function()
            return require "plugins.configs.conform"
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        config = function()
            require("lsp_signature").setup {
                bind = true,
                floating_window = true,
                hint_enable = false,
                handler_opts = { border = "rounded" },
            }
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            return require "plugins.configs.dap"
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            return require "plugins.configs.dapui"
        end,
    },
}
