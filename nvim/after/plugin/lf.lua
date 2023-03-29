if vim.g.vscode then
  return
end

require("lf").setup({
  winblend = 0,
  highlights = { NormalFloat = { guibg = "NONE" } },
  border = "rounded", -- border kind: single double shadow curved
  height = 0.70,
  width = 0.85,
  escape_quit = false,
})

vim.keymap.set("n", "<leader>o", ":Lf<CR>")
