require("project_nvim").setup({
  detection_methods = { "pattern" },
  patterns = { ".project" },
  show_hidden = true,
  silent_chdir = true,
  ignore_lsp = {},
  datapath = vim.fn.stdpath("data"),
})

pcall(require("telescope").load_extension, "projects")