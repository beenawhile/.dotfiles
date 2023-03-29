if vim.g.vscode then
  return
end

vim.keymap.set("n", "<leader>fr", ":FlutterRun<CR>")
vim.keymap.set("n", "<leader>fhl", ":FlutterReload<CR>")
vim.keymap.set("n", "<leader>fhs", ":FlutterRestart<CR>")
