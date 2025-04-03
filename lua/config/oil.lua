local oil = require("oil")

oil.setup({
  default_file_explorer = true,
  auto_cd = false,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "oil://*",
  callback = function()
    local oil_dir = require("oil").get_current_dir()
    if oil_dir and vim.fn.isdirectory(oil_dir) == 1 then
      if vim.loop.os_uname().sysname:find("Windows") then
        oil_dir = oil_dir:gsub("/", "\\")
      end
      vim.fn.chdir(oil_dir)
    end
  end,
})