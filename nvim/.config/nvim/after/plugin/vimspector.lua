local map = vim.api.nvim_set_keymap

vim.g.vimspector_sidebar_width = 85
vim.g.vimspector_bottombar_height = 15
vim.g.vimspector_terminal_maxwidth = 70

vim.keymap.set("n","<F8>", ":vimspector#Launch()<CR>")
vim.keymap.set("n","<F5>", ":vimspector#StepOver()<CR>")
vim.keymap.set("n","<F8>", ":vimspector#Reset()<CR>")
vim.keymap.set("n","<F11>", ":vimspector#StepOver()<CR>")
vim.keymap.set("n","<F12>", ":vimspector#StepOut()<CR>")
vim.keymap.set("n","<F10>", ":vimspector#StepInto()<CR>")

vim.keymap.set('n', "Db", ":vimspector#ToggleBreakpoint()<cr>")
vim.keymap.set('n', "Dw", ":vimspector#AddWatch()<cr>")
vim.keymap.set('n', "De", ":vimspector#Evaluate()<cr>")
