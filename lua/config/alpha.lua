local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local splashes = {
  "Where are we now?",
  "Help the poor children in Uganda!",
  "Redstone powered!",
  "Strike the earth!",
}

math.randomseed(os.time())
local random_footer = splashes[math.random(1, #splashes)]

dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \ /' __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

local buttons = {
  dashboard.button("p", "  Browse projects", ":Telescope projects<CR>"),
  dashboard.button("f", "  Browse files", ":Telescope find_files<CR>"),
  dashboard.button("g", "  Browse folders", ":Telescope file_browser<CR>"),
  dashboard.button("r", "  Browse recent", ":Telescope oldfiles<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

dashboard.section.buttons.val = buttons
dashboard.section.footer.val = random_footer

alpha.setup(dashboard.config)

local function set_home_directory()
  local is_windows = vim.loop.os_uname().sysname:find("Windows")
  local home_dir

  if is_windows then
    home_dir = "C:/Projects"
    if vim.fn.isdirectory(home_dir) == 0 then
      home_dir = "C:/"
    end
  else
    home_dir = vim.fn.expand("~")
  end

  vim.cmd("cd " .. home_dir)
end

vim.api.nvim_create_autocmd("User", {
  pattern = "AlphaReady",
  callback = function()
    set_home_directory()

    local mf = require("mini.files")
    mf.refresh()
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local buf_ft = vim.bo.filetype
    if buf_ft == "alpha" then
      set_home_directory()

      local mf = require("mini.files")
      mf.refresh()
    end
  end,
})