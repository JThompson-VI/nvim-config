return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
        ignore_whitespace = false,
      },

      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map('n', '<leader>gj', gs.next_hunk, "Next Hunk")
        map('n', '<leader>gk', gs.prev_hunk, "Prev Hunk")
        map('n', '<leader>gs', gs.stage_hunk, "Stage Hunk")
        map('n', '<leader>gr', gs.reset_hunk, "Reset Hunk")
        map('n', '<leader>gS', gs.stage_buffer, "Stage buffer")
        map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>gl", function() gs.blame_line() end, "Blame Line")
        -- map("n", "<leader>gl", function() gs.blame_line({ full = true }) end, "Blame Line")

        -- stylua: ignore start
        --map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        --map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        --map("n", "<leader>ghd", gs.diffthis, "Diff This")
        --map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        --map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
  {
    "moll/vim-bbye",
  },
  {
    "folke/which-key.nvim",
    opts = function()
      return {
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
          },
          presets = {
            operators = false,    -- adds help for operators like d, y, ...
            motions = false,      -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false,      -- default bindings on <c-w>
            nav = false,          -- misc bindings to work with windows
            z = true,             -- bindings for folds, spelling and others prefixed with z
            g = false,            -- bindings for prefixed with g
          }
        },
        ignore_missing = true,
        triggers_nowait = {
          "'",
          '"',
        },
      }
    end,
  },
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = "*",
  --   config = function()
  --     require("bufferline").setup {}
  --   end
  -- },
  {
    'numToStr/FTerm.nvim',
    lazy = true,
  },
  {
    'ThePrimeagen/harpoon',
    config = function()
      local harpoon = require("harpoon").setup()
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { desc = desc })
      end

      local ui = require("harpoon.ui")
      map('n', '<leader>mm', ui.toggle_quick_menu)
      map('n', '<leader>ma', require("harpoon.mark").add_file)
      map('n', '<leader>m1', function() ui.nav_file(1) end, "Nav file 1")
      map('n', '<leader>m2', function() ui.nav_file(2) end, "Nav file 2")
      map('n', '<leader>m3', function() ui.nav_file(3) end, "Nav file 3")
      map('n', '<leader>m4', function() ui.nav_file(4) end, "Nav file 4")
    end,
  }
}
