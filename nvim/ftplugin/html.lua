local opt = vim.opt

local Path = require("plenary.path")

-- Function to set filetype to htmldjango if .hsignore file exists
local function check_hsignore()
  if Path:new(vim.fn.getcwd(), ".hsignore"):exists() and vim.fn.getcwd() or nil then
    opt.filetype = "htmldjango"
  end
end

check_hsignore()
