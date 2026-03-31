return {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/zls" },
  filetypes = { "zig" },
  root_markers = { "build.zig", "build.zig.zon" },
  settings = {
    zls = {
      enable_snippets = true,
      enable_zig_zon_support = true,
      zig_exe_path = vim.fn.exepath("zig"),
    },
  },
}
