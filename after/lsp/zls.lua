local function get_zig_lib_path()
  local stdout = vim.fn.system({ "zig", "env" })
  if vim.v.shell_error ~= 0 then
    vim.notify("zls: Failed to run 'zig env'", vim.log.levels.ERROR)
    return nil
  end

  local path = string.match(stdout, '%.lib_dir%s*=%s*"([^"]+)"')
  if not path then
    vim.notify("zls: Failed to parse 'zig env' output for '.lib_dir'", vim.log.levels.ERROR)
    return nil
  end
  return path
end

-- Get the path
local zig_lib_path = get_zig_lib_path()
local zls_settings = {
  enable_snippets = true,
  enable_zig_zon_support = true,
}

if zig_lib_path then
  zls_settings.zig_lib_path = zig_lib_path
else
  vim.notify("zls: zig_lib_path not found. 'Go to Definition' for std may not work.", vim.log.levels.WARN)
end


return {
  settings = zls_settings,
}
