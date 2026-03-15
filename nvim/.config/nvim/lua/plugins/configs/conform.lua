local utils = require "custom.utils"

return {
    notify_on_error = true,

    formatters_by_ft = {
        lua = { "stylua" },
        -- clang-format doesnt work since in formatters, it cannot use - for key
        cpp = { "clang_format" },
        c = { "clang_format" },
        py = { "ruff" },
        sh = { "shfmt" },
    },

    formatters = {
        clang_format = {
            -- actual bin to invoke for formatting
            command = "clang-format",
            prepend_args = { "--style={BasedOnStyle: Google, IndentWidth: 4}" },
        },
    },

    format_on_save = function(bufnr)
        local excluded = utils.is_excluded(bufnr, "format")

        if excluded then
            return
        else
            return {
                lsp_format = "fallback",
                async = false,
                timeout_ms = 500,
            }
        end
    end,
}
