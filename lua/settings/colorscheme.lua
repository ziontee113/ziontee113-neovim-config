require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = false,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = true,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "soft", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
})

vim.cmd([[
    colorscheme gruvbox
    hi Normal guibg=NONE
    hi SignColumn guibg=NONE
    hi FloatBorder guibg=NONE guifg=#b8b8b8
    hi Cursorline guibg=#0f0f0f
]])
