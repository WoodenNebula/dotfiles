local dap = require "dap"
local dapui = require "dapui"

dapui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➡", texthl = "", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  vim.defer_fn(function()
    print "DAP Initialized - Opening UI"
    require("dap").repl.open()
    dapui.open()
  end, 100)
end
dap.listeners.after.event_terminated["dapui_config"] = function()
  print "DAP Terminated - Closing UI"
  dapui.close()
end
dap.listeners.after.event_exited["dapui_config"] = function()
  dapui.close()
end
