require("toggleterm").setup({
    size = 10,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = "0",
    start_in_insert = true,
    persist_size = true,
    direction = "float",
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit_normal
local lazygit_big

local function shutdown_then_toggle_toggleterm_terminal(terminal_variable, terminal_create_function) --{{{
    terminal_variable = terminal_create_function()
    terminal_variable:toggle()
end

local function create_lazygit_normal()
    return Terminal:new({
        cmd = "EDITOR=nvim lazygit",
        hidden = true,
    })
end

local function create_lazygit_big()
    return Terminal:new({
        cmd = "EDITOR=nvim lazygit",
        hidden = true,
        float_opts = { width = 1920, border = "none", height = 1080 },
    })
end

vim.keymap.set("n", "<C-5>", function() -- lazygit_normal
    shutdown_then_toggle_toggleterm_terminal(lazygit_normal, create_lazygit_normal)
end, { silent = true })

vim.keymap.set("n", "<C-4>", function() -- lazygit_big
    shutdown_then_toggle_toggleterm_terminal(lazygit_big, create_lazygit_big)
end, { silent = true })
