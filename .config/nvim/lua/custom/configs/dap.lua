local ok, dap = pcall(require, "dap")
local last_config = nil

if not ok then
  return
end

---@param session Session
dap.listeners.after.event_initialized["store_config"] = function(session)
  last_config = session.config
end

function run_last()
  if last_config then
    dap.run(last_config)
  else
    dap.continue()
  end
end

dap.adapters.gdb = {
  type = "executable",
  command = "/usr/bin/gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.c = {
  {
    name = "Run executable (GDB)",
    type = "gdb",
    request = "launch",
    program = function()
      local bin_path = vim.fn.getcwd() .. "/bin/"

      local handle = io.popen("find " .. bin_path .. " -maxdepth 1 -type f -executable")
      local result = handle:read "*a"
      handle:close()
      return result:gsub("%s+$", "")
    end,
    cwd = "${workspaceFolder}",
  },
}
