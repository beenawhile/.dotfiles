local colorscheme = "catppuccin"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local status_ok, theme = pcall(require, colorscheme)
if not status_ok then
  return
end

theme.setup({
  flavour = "mocha", -- latte, frappe, macchiato, or mocha
  transparent_background = true,
  color_overrides = {
    all = {
      surface0 = "#444444",
      surface1 = "#666666",
      surface2 = "#a3a7bc",
      surface3 = "#a3a7bc",
    },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    harpoon = true,
    telescope = true,
  },
})
