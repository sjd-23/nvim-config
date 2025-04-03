require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "java",
    "html",
    "css",
    "javascript",
    "typescript",
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },
})