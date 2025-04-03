vim.keymap.set("n", "<leader>e", function()
  local oil = require("oil")
  if oil.get_current_dir() then
    local ok, err = pcall(function()
      vim.cmd("b#")
    end)
    if not ok then
      vim.api.nvim_echo({
        {"Oil: ", "WarningMsg"},
        {"No previous buffer to return to. Try opening a file first."}
      }, false, {})
    end
  else
    local current_path = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":p"):gsub("\\", "/")
    if vim.fn.isdirectory(current_path) == 1 then
      vim.cmd("cd " .. current_path)
    end
    local ok, err = pcall(function()
      vim.cmd("Oil .")
    end)
    if not ok then
      vim.api.nvim_echo({
        {"Oil: ", "WarningMsg"},
        {"Could not open file explorer. This might happen when no file is currently open."}
      }, false, {})
    end
  end
end, { desc = "Toggle Oil" })