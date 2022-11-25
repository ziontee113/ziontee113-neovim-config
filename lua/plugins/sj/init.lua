local sj = require("sj")
sj.setup({
	auto_jump = true,
	separator = "",
})

vim.keymap.set({ "n", "x" }, "s", function()
	vim.cmd("norm! m'")

	sj.run({})
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
