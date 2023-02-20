local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " ", hint = " ", info = " " },
  colored = true,
  update_in_insert = true,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " },
  cond = hide_in_width,
}

require("lualine").setup({
  options = {
    theme = "catppuccin",
    icons_enabled = true,
    always_divide_middle = false,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { diff, diagnostics },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename", "location" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})

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
