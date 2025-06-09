local dap = require "dap"

local map = vim.keymap.set

-- dap keymappins
map("n", "<F5>", function()
  dap.continue()
end, { desc = "Start Debugging" })

map("n", "<F10>", function()
  dap.step_over()
end, { desc = "Step Over" })

map("n", "<F11>", function()
  dap.step_into()
end, { desc = "Step Into" })

map("n", "<S-F11>", function()
  dap.step_out()
end, { desc = "Step Out" })

map("n", "<F9>", function()
  dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

map("n", "<Leader>dr", function()
  dap.repl.open()
end, { desc = "Open Debug Console" })
-- !dap keymappins

map({ "n", "t" }, "<A-f>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
