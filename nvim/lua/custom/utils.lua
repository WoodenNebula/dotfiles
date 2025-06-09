local M = {
  excluded_patterns = { ["lsp"] = {}, ["format"] = {} },
  is_initialized = false,
}

-- read list of files to exclude from attaching lsp
function M.initialize_exclude_pattern()
  local prj_dir = vim.fn.getcwd()
  local excludes = { "format", "lsp" }

  for _, exclude_type in ipairs(excludes) do
    -- file ppath to lsp-exclude within the project that contains all the file types to exclude lsp from
    local exclude_list_path = prj_dir .. "/.nvim/" .. exclude_type .. "-exclude"
    local f = io.open(exclude_list_path, "r")

    if f then
      print(exclude_type .. "-exclude file found")
      for line in f:lines() do
        local pattern = vim.trim(line)
        if pattern ~= "" and not pattern:match "^#" then -- skip empty and comments
          table.insert(M.excluded_patterns[exclude_type], pattern)
        end
      end
      f:close()
    else
      print("No " .. exclude_type "-exclude file!")
    end
  end
end

function M.is_excluded(
  bufnr --[[int]],
  exclude_type --[[lsp]]
)
  if not M.is_initialized then
    M.initialize_exclude_pattern()
    M.is_initialized = true
  end

  local path = vim.api.nvim_buf_get_name(bufnr)
  local ft = vim.bo[bufnr].filetype

  for _, pattern in ipairs(M.excluded_patterns[exclude_type]) do
    -- Match glob extensions
    if pattern:match "^%*%." then
      local ext = pattern:match "^%*%.(.+)$"
      if path:match("%." .. ext .. "$") or ft == ext then
        return true, pattern
      end
    end

    -- Match file name
    local filename = vim.fn.fnamemodify(path, ":t")
    if filename == pattern then
      return true, pattern
    end

    -- Relative path pattern match (supports folder/file match)
    if path:match(pattern) then
      return true, pattern
    end
  end

  return false
end

return M
