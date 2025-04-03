return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("config.lsp")
    end,
  },
}