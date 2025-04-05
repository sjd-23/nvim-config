return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-project.nvim",
  },
  config = function()
    require("config.telescope")
  end,
}