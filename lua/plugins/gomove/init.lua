require("gomove").setup({
	map_defaults = false,
	reindent = true,
	undojoin = true,
	move_past_end_col = false,
})

local map = vim.api.nvim_set_keymap

-- Normal Mode Move / Duplicate
map("n", "<A-S-j>", "<Plug>GoNSMDown", {})
map("n", "<A-S-k>", "<Plug>GoNSMUp", {})
map("n", "<A-S-h>", "<Plug>GoNSMLeft", {})
map("n", "<A-S-l>", "<Plug>GoNSMRight", {})

-- map("n", "<A-S-j>", "<Plug>GoNSDDown", {})
-- map("n", "<A-S-k>", "<Plug>GoNSDUp", {})
-- map("n", "<A-S-h>", "<Plug>GoNSDLeft", {})
-- map("n", "<A-S-l>", "<Plug>GoNSDRight", {})

-- Visual Mode Move
map("x", "<A-j>", "<Plug>GoVSMDown", {})
map("x", "<A-k>", "<Plug>GoVSMUp", {})
map("x", "<A-h>", "<Plug>GoVSMLeft", {})
map("x", "<A-l>", "<Plug>GoVSMRight", {})

-- Visual Mode Duplicate
map("x", "<A-S-j>", "<Plug>GoVSDDown", {})
map("x", "<A-S-k>", "<Plug>GoVSDUp", {})
map("x", "<A-S-h>", "<Plug>GoVSDLeft", {})
map("x", "<A-S-l>", "<Plug>GoVSDRight", {})

-- {{{nvim-execute-on-save}}}
