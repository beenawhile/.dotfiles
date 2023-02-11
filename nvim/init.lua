if vim.g.vscode then
  -- VSCode extension
  require("vscode")
else
  -- ordinary Neovim
  require("user")
end

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac then
  require('os.macos')
end
if is_win then
  require('os.windows')
end
if is_wsl then
  require('os.wsl')
end
