require "nvchad.mappings"
-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map({ "i", "n" }, "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map({ "i", "n" }, "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

map("v", "<A-j>", ":m '>+1<CR>gv==gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv==gv", { desc = "Move selection up" })

map({ "n" }, "<leader>k", function()
  vim.lsp.buf.signature_help()
end, { desc = "Show function signature in floating window", silent = true })
