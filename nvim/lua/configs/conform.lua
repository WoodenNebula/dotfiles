return {
  notify_on_error = true,
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },

  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    c = { "clang-format" },
  },

  formatters = {
    clang_format = {
      prepend_args = { "--style=file", "--fallback-style=Google" },
    },
  },
}
