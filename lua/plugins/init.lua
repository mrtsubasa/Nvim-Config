return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          neotree = true,
          cmp = true,
          treesitter = true,
          noice = true,
        }
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "3rd/image.nvim",
    lazy = false,
    build = false,
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki", "quarto" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      window_overlap_clear_enabled = false,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Trouver Fichier" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Chercher texte (grep)" },
    },
    config = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup {
        options = { theme = 'catppuccin' }
      }
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "gopls", "pyright", "lua_ls", "tailwindcss", "eslint" },
      })
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({ capabilities = capabilities })
        end,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 })
        },
        snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
        }
      })
    end,
  },
  { "vyfor/cord.nvim", lazy = false, config = true },
  { "nvim-neo-tree/neo-tree.nvim", lazy = false, branch = "v3.x", dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" } },
  { "OXY2DEV/markview.nvim", lazy = false },
  { "folke/noice.nvim", lazy = false, opts = {}, dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup {}
      vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>", { desc = "Neogit Status" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "tpope/vim-dadbod",
    lazy = false,
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<cr>", { desc = "Toggle DB UI" })
    end,
  },
  {
    "pwntester/octo.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
}