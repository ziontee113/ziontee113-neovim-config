local sj = require("sj")
sj.setup({
	auto_jump = true,
	separator = "",
})

local function jump()
	vim.cmd("norm! m'")
	sj.run({})
end

vim.keymap.set({ "n", "x" }, "s", function()
	jump()
end)

-- STS with SJ
vim.keymap.set("n", "<A-n>", function()
	jump()
	vim.cmd("norm vx")
end)
vim.keymap.set("n", "<A-y>", function()
	jump()
	FEED("vxY<C-o>", "m")
end)
vim.keymap.set("n", "<A-S-y>", function()
	jump()
	FEED("vny<C-o>", "m")
end)

local function sj_multi_win()
	vim.cmd("norm! m'")
	vim.cmd("WindowsDisableAutowidth")
	sj.run({ select_window = true })
	vim.schedule(function()
		vim.cmd("WindowsEnableAutowidth")
	end)
end

KS("n", { "S", "?" }, function()
	sj_multi_win()
end)

vim.keymap.set("o", "f", function()
	sj.run()
end)

-- {{{nvim-execute-on-save}}}
