local ibl = require("ibl")

ibl.setup({
  indent = {
    char = "│",
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    highlight = {"Function", "Label"},
  },
  exclude = {
    filetypes = {
      "help",
      "terminal",
      "dashboard",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "mason",
      "lazy",
      "oil",
    },
    buftypes = {
      "terminal",
      "prompt",
      "nofile",
    },
  },
})