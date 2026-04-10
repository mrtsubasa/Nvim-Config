# Nvim-Config

Configuration Neovim basée sur **NvChad (v2.5)**, avec **lazy.nvim** comme gestionnaire de plugins, orientée dev au quotidien (LSP/complétion, Git, recherche, Markdown, etc.).

## Prérequis

- Neovim **0.10+** (utilise `vim.uv` et `vim.lsp.enable`)
- Git
- Une Nerd Font (icônes)
- Recommandé :
  - `ripgrep` (pour `Telescope live_grep`)
  - Terminal compatible pour les images Markdown : **Kitty** (config actuelle de `image.nvim`)

## Installation (sans écraser ton nvim)

Clone dans un dossier dédié, puis lance Neovim via `NVIM_APPNAME` :

```sh
git clone https://github.com/mrtsubasa/Nvim-Config ~/.config/nvim-config
NVIM_APPNAME=nvim-config nvim
```

Au premier lancement, les plugins se bootstrap automatiquement via `lazy.nvim`.

## Ce que contient la config

### UI / UX

- Thème : **catppuccin** (mocha) + fond transparent
- Statusline : **lualine**
- Explorateur : **neo-tree**
- UI améliorée : **noice.nvim** (+ notifications)
- Markdown :
  - **markview.nvim**
  - **image.nvim** (backend Kitty) pour afficher des images dans les buffers Markdown

### Recherche & navigation

- **telescope.nvim** (fichiers / grep)

### LSP / complétion

- Gestion LSP : **mason.nvim** + **mason-lspconfig.nvim** + **nvim-lspconfig**
- Complétion : **nvim-cmp** (+ LuaSnip, lspkind)
- Serveurs LSP installés par Mason (par défaut dans cette config) :
  - `ts_ls`, `gopls`, `pyright`, `lua_ls`, `tailwindcss`, `eslint`
  - + activation explicite de `html` et `cssls`

### Git & GitHub

- **gitsigns.nvim** (hunks/blame/signs)
- **neogit** (+ **diffview.nvim**)
- **octo.nvim** (GitHub issues/PRs)

### Base de données

- **vim-dadbod** + **vim-dadbod-ui** + completion

### Discord Rich Presence

- **cord.nvim**

## Raccourcis utiles

- Leader : `Espace`
- `;` → `:` (mode normal)
- `jk` → `Esc` (mode insert)
- Telescope :
  - `<leader>ff` : trouver un fichier
  - `<leader>fg` : chercher du texte (live_grep)
- Git :
  - `<leader>gs` : ouvrir Neogit
- DB :
  - `<leader>db` : toggle Dadbod UI

## Où modifier quoi

- Plugins : [init.lua](file:///Users/l.dev/Documents/Nvim-Config/lua/plugins/init.lua)
- Options / mappings : [options.lua](file:///Users/l.dev/Documents/Nvim-Config/lua/options.lua), [mappings.lua](file:///Users/l.dev/Documents/Nvim-Config/lua/mappings.lua)
- Réglages Lazy : [lazy.lua](file:///Users/l.dev/Documents/Nvim-Config/lua/configs/lazy.lua)
- LSP (NvChad) : [lspconfig.lua](file:///Users/l.dev/Documents/Nvim-Config/lua/configs/lspconfig.lua)
