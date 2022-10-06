vim.o.showtabline = 2

local tabLineFill = { fg = "#f2e9de", bg = "#000000", style = "italic" }
local tabLine = { fg = "#f2e9de", bg = "#000000", style = "italic" }
local tabLineSel = { fg = "#f2e9de", bg = "#333333", style = "italic" }

local theme = {
	fill = tabLineFill,
	head = tabLine,
	current_tab = tabLineSel,
	tab = tabLine,
	win = tabLine,
	tail = tabLine,
}
require("tabby.tabline").set(function(line)
	return {
		{
			-- { "  ", hl = theme.head },
			-- line.sep("", theme.head, theme.fill),
		},
		line.tabs().foreach(function(tab)
			local hl = tab.is_current() and theme.current_tab or theme.tab
			return {
				line.sep("", hl, theme.fill),
				tab.is_current() and "" or "",
				tab.number(),
				tab.name(),
				-- tab.close_btn(""),
				line.sep("", hl, theme.fill),
				hl = hl,
				margin = " ",
			}
		end),
		line.spacer(),
		line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
			return {
				line.sep("", theme.win, theme.fill),
				win.is_current() and "" or "",
				win.buf_name(),
				line.sep("", theme.win, theme.fill),
				hl = win.is_current() and tabLineSel or theme.win,
				margin = " ",
			}
		end),
		{
			-- line.sep("", theme.tail, theme.fill),
			-- { "  ", hl = theme.tail },
		},
		hl = theme.fill,
	}
end)
