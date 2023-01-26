if vim.g.vscode then
  -- VSCode extension
  vim.cmd [[source $HOME/.config/nvim/vscode/init.vim]]
else
  -- ordinary Neovim
  require("user")
end
