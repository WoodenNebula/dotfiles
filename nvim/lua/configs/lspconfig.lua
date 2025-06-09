local nvlsp = require "nvchad.configs.lspconfig"
local utils = require "custom.utils"

local servers = { "clangd", "lua_ls" }

local function custom_on_attach(client, bufnr)
  local excluded, _ = utils.is_excluded(bufnr, "lsp")
  if excluded then
    vim.schedule(function()
      vim.diagnostic.disable(bufnr)
      vim.lsp.buf_detach_client(bufnr, client.id)
    end)
    return
  end
  nvlsp.on_attach(client, bufnr)
end

for _, lsp in pairs(servers) do
  require("lspconfig")[lsp].setup {
    on_attach = custom_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
