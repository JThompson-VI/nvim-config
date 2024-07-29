return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      vim.cmd('highlight FloatBorder ctermfg=NONE ctermbg=NONE cterm=NONE guifg=white')
      local servers = {
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }
              },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                }
              },
            },

          }
        },
        volar = {},
        tsserver = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "~/.local/lib/node_modules/@vue/typescript-plugin",
                languages = {"javascript", "typescript", "vue"},
              }
            }
          },
          filetypes = {
            "javascript",
            "typescript",
            "vue",
          }
        },
      }

      local _border = 'rounded'
      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = _border }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = _border }),
      }

      local on_attach = function(_, bufnr)
        vim.diagnostic.config {
          float = {
            border = _border,
          }
        }
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('gvd', "<CMD>:vsp | lua vim.lsp.buf.definition()<CR>")
        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation') -- was overwritting move to upper split
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
        nmap("gl", vim.diagnostic.open_float)
        nmap("<leader>lk", vim.diagnostic.goto_prev)
        nmap("<leader>lj", vim.diagnostic.goto_next)
        -- nmap("<leader>lf",
        --   function()
        --     vim.lsp.buf.format { filter = function(client)
        --       return client.name ~= "tsserver"
        --     end }
        --   end)

        nmap('<leader>lr', vim.lsp.buf.rename, '[L]sp [R]ename')
      end

      require('mason').setup()

      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }
      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            handlers = handlers,
            init_options = servers[server_name].init_options,
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name].settings,
            filetypes = (servers[server_name] or {}).filetypes,
          }
        end,
      }
    end
  },
}
