local nvlsp = require "nvchad.configs.lspconfig"
local utils = require "custom.utils"

local servers = { "clangd", "lua_ls", "pyright", "bashls" }

local function custom_on_attach(client, bufnr)
    local excluded, _ = utils.is_excluded(bufnr, "lsp")
    if excluded then
        vim.schedule(function()
            vim.diagnostic.enable(false, bufnr)
            vim.lsp.buf_detach_client(bufnr, client.id)
        end)
        return
    end
    nvlsp.on_attach(client, bufnr)
end

for _, lsp in pairs(servers) do
    -- get the custom options for the lsp
    local opts = {
        on_attach = custom_on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }

    -- Ignore `vim` warning in lua files
    if lsp == "lua_ls" then
        opts.settings = {
            Lua = { diagnostics = { globals = { "vim" } } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        }
    end

    vim.lsp.config(lsp, opts)
    vim.lsp.enable(lsp)
end

vim.diagnostic.config {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
}

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(
            nil,
            { focus = false, scope = "line", close_events = { "InsertEnter", "CursorMoved", "BufLeave" } }
        )
    end,
})
