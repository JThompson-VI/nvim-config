-- mainly deveoper ergonomics plugins
return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },
  {
    'windwp/nvim-autopairs',
    config = true 
  },
  {
    "numToStr/Comment.nvim",
    config = true
  }
  
}

