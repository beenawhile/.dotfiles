local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.keymap.set({ "n", "x" }, "<space>", [[:call VSCodeNotify('whichkey.show')<CR>]], opts)

keymap("n", "<Tab>", ":Tabnext<CR>", opts)
keymap("n", "<S-Tab>", ":Tabprev<CR>", opts)
keymap("n", "<S-Tab>", ":Tabprev<CR>", opts)
keymap("n", "<S-Tab>", ":Tabprev<CR>", opts)

keymap("n", "<C-w>_", ":call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>", opts)
keymap("n", "<C-w>=", ":call VSCodeNotify('workbench.action.evenEditorWidths')<CR>", opts)

keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
