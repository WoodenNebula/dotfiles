local utils = require "custom.utils"

return {
    notify_on_error = true,

    formatters_by_ft = {
        lua = { "stylua" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        py = { "ruff" },
    },

    formatters = {
        clang_format = {
            prepend_args = { "--style=file", "--fallback-style=Google" },
        },
    },

    format_on_save = function(bufnr)
        local excluded = utils.is_excluded(bufnr, "format")
        if excluded then
            return
        else
            print("Formating enabled for " .. vim.api.nvim_buf_get_name(bufnr))
            return {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            }
        end
    end,
}
