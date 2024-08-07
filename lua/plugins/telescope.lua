return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local telescope = require('telescope').setup {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          mappings = {
            n = {
              ["q"] = function(...)
                return require("telescope.actions").close(...)
              end,
            },
          }
        }
      }
      vim.keymap.set('n', '<leader>go', require('telescope.builtin').git_status, { desc = '[G]it [O]pen status' })
      vim.keymap.set('n', '<leader>f', require('telescope.builtin').git_files, { desc = '[F]iles' })
      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>tr', require('telescope.builtin').lsp_references, { desc = '[T]elescope [R]eferences' })
      vim.keymap.set('n', '<leader>sc', require('telescope.builtin').resume, { desc = '[S]earch [C]ontinue' })
      -- vim.keymap.set('n', '<leader>sm', require('telescope.builtin').marks, { desc = '[S]earch [M]arks' })
      vim.keymap.set('n', '<leader>sm',
        function()
          require('telescope.builtin').marks(require('telescope.themes').get_dropdown {
            previewer = false,
          })
        end, { desc = '[S]earch [M]arks' })

      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          -- winblend = 5,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })
    end
  }
}
