-- Oil, open and close (Space + e)
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
        {"Could not open file explorer. Has a file been opened yet?"}
      }, false, {})
    end
  end
end, { desc = "Toggle Oil" })

vim.keymap.set("n", "<leader>ls", function()
  local cwd = vim.fn.getcwd()
  
  if vim.fn.executable("live-server") ~= 1 then
    vim.notify("Live Server: live-server is not installed or not in PATH. Please install it via npm.", vim.log.levels.WARN)
    return
  end
  
  local is_wsl = vim.fn.system("uname -r"):match("WSL") ~= nil or vim.fn.system("uname -r"):match("Microsoft") ~= nil
  
  local cmd = {}
  local os = vim.loop.os_uname().sysname
  
  if os == "Windows_NT" then
    cmd = {"cmd.exe", "/k", "cd /d " .. cwd .. " && live-server"}
  elseif os == "Darwin" then
    cmd = {"osascript", "-e", string.format([[tell app "Terminal" to do script "cd '%s' && live-server"]], cwd)}
  elseif is_wsl then
    cmd = {"wt.exe", "bash", "-c", "cd \"$(pwd)\" && live-server"}
    
  else
    local terminal = vim.fn.executable("x-terminal-emulator") == 1 and "x-terminal-emulator" or "gnome-terminal"
    cmd = {terminal, "--", "bash", "-c", "cd '" .. cwd .. "' && live-server"}
  end
  
  vim.fn.jobstart(cmd, {detach = true})
end, {desc = "Launch live-server"})