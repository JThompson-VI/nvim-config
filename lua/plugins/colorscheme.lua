return {
  -- {
  -- "folke/tokyonight.nvim",
  --   'rose-pine/neovim',
  --   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('rose-pine').setup({
  --       variant = 'moon'
  --     })
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme rose-pine]])
  --   end,
  -- },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        background = 'hard'
        -- Your config here

      })
      vim.cmd([[colorscheme everforest]])
    end,
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   -- Optional; default configuration will be used if setup isn't called.
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = 'frappe'
  --
  --     })
  --     vim.cmd.colorscheme "catppuccin"
  --   end,
  -- },
}
