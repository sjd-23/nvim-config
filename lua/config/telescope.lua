local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
    },
    project = {
      hidden_files = true,
      theme = "dropdown",
      order_by = "recent",
      sync_with_nvim_tree = true,
      on_project_selected = function(prompt_bufnr)
        require("telescope.actions").close(prompt_bufnr)
      end,
    },
  },
})

telescope.load_extension("file_browser")
telescope.load_extension("project")

local original_set_lines = vim.api.nvim_buf_set_lines
vim.api.nvim_buf_set_lines = function(bufnr, ...)
  if vim.api.nvim_buf_is_valid(bufnr) then
    return pcall(original_set_lines, bufnr, ...)
  end
end