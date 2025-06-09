local M = require "configs.conform"
local utils = require "custom.utils"

M.format_on_save = function(bufnr)
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
end

return M
