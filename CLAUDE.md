# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration written in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Plugin Management

Plugins are managed via lazy.nvim. Common commands (run inside Neovim):
- `:Lazy sync` — install/update/clean plugins
- `:Lazy update` — update all plugins
- `:Lazy clean` — remove unused plugins
- `:Mason` — manage LSP servers, linters, formatters

The `lazy-lock.json` file pins exact plugin versions for reproducibility. Update it by running `:Lazy update`.

## Architecture

**Entry point:** `init.lua` loads `stefan.core` (options + keymaps) then `stefan.lazy` (plugin manager + all plugins).

**Namespace:** All Lua modules live under `lua/stefan/`.

```
lua/stefan/
├── core/
│   ├── init.lua       # Loads options and keymaps
│   ├── options.lua    # Vim options (tabs, line numbers, etc.)
│   └── keymaps.lua    # Global keybindings; leader = <space>
├── lazy.lua           # lazy.nvim bootstrap + setup
└── plugins/
    ├── init.lua       # Base deps (plenary, tmux-navigator)
    ├── lsp/
    │   ├── mason.lua      # Mason + mason-lspconfig setup
    │   └── lspconfig.lua  # LSP server configs + on_attach keymaps
    └── *.lua          # One file per plugin
```

**Adding a plugin:** Create a new file in `lua/stefan/plugins/` returning a lazy.nvim spec table. Lazy.nvim auto-imports everything in that directory. LSP-specific plugins go in `lua/stefan/plugins/lsp/`.

**after/ directory:** `after/lsp/zls.lua` contains Zig language server overrides applied after the main LSP setup.

## Key Conventions

- Leader key: `<space>`
- Indentation: 4 spaces
- Colorscheme: catppuccin-macchiato
- Language servers installed via Mason: `lua_ls`, `gopls`, `zls`, `html`, `cssls`, `tailwindcss`, `graphql`
- LSP on-attach keymaps are defined in `lua/stefan/plugins/lsp/lspconfig.lua`
