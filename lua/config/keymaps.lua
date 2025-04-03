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
        {"Could not open file explorer. This might happen when no file is currently open."}
      }, false, {})
    end
  end
end, { desc = "Toggle Oil" })

vim.keymap.set("n", "<leader>ls", function()
  local cwd = vim.fn.getcwd()
  local os = vim.loop.os_uname().sysname

  if os == "Windows_NT" then
    vim.fn.jobstart({
      "cmd.exe",
      "/k",
      "cd /d " .. cwd .. " && live-server"
    }, { detach = true })

  elseif os == "Darwin" then
    vim.fn.jobstart({
      "osascript",
      "-e",
      string.format(
        [[tell app "Terminal" to do script "cd '%s' && live-server"]],
        cwd
      )
    }, { detach = true })

  else
    local terminal = vim.fn.executable("x-terminal-emulator") == 1
        and "x-terminal-emulator"
        or "gnome-terminal"
    vim.fn.jobstart({
      terminal,
      "--",
      "bash",
      "-c",
      "cd '" .. cwd .. "' && live-server"
    }, { detach = true })
  end
end, { desc = "Launch live-server" })

