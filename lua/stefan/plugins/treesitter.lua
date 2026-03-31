return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter").install({
      "asm",
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "graphql",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "c",
      "comment",
      "eex",
      "elixir",
      "go",
      "gomod",
      "gosum",
      "gotmpl",
      "gowork",
      "heex",
      "helm",
      "make",
      "nasm",
      "nginx",
      "proto",
      "python",
      "regex",
      "ruby",
      "rust",
      "sql",
      "zig",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        if pcall(vim.treesitter.start) then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    require("nvim-ts-autotag").setup()
  end,
}
