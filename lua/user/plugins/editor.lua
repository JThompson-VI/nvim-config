return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "~" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
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
    config = function()
      require("which-key").setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
          },
          presets = {
            operators = false,  -- adds help for operators like d, y, ...
            motions = false,    -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false,    -- default bindings on <c-w>
            nav = false,        -- misc bindings to work with windows
            z = true,          -- bindings for folds, spelling and others prefixed with z
            g = false,          -- bindings for prefixed with g
          }
        },
        ignore_missing = true,
        triggers_nowait = {
          "'",
          '"',
        },
      })
    end
  }
}
