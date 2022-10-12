local ts_utils = require("nvim-treesitter.ts_utils")
local ns = vim.api.nvim_create_namespace("test-ns")

local function set_abunch_ofextmarks(buf, lnumLines)
	for i, lnum in ipairs(lnumLines) do
		local leString = tostring(lnum + 1)

		if #leString == 1 then
			leString = " " .. leString
		end

		vim.api.nvim_buf_set_extmark(buf, ns, i - 1, 0, {
			virt_text = { { leString, "GruvBoxYellow" } },
			virt_text_pos = "overlay",
		})
	end
end

local function newWindow(filetype, opts)
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(buf, "filetype", filetype)
	vim.api.nvim_buf_set_option(buf, "bufhidden", "delete")

	local stats = vim.api.nvim_list_uis()[1]
	local width = stats.width
	local height = stats.height
	local winWidth = 44
	local winHeight = 12

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = winWidth,
		col = math.ceil((width - winWidth) / 2),
		row = math.ceil((height - winHeight) / 2) - 1,
		style = "minimal",
		height = winHeight,
		border = "single",
	})

	vim.api.nvim_win_set_option(win, "winhl", "Normal:")
	vim.api.nvim_win_set_option(win, "scrolloff", 2)
	vim.api.nvim_win_set_option(win, "conceallevel", 2)
	vim.api.nvim_win_set_option(win, "concealcursor", "n")
	vim.api.nvim_win_set_option(win, "cursorline", true)

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, opts.textLines or {})

	set_abunch_ofextmarks(buf, opts.lnumLines)

	local function babyComeToMe()
		local curLine = vim.api.nvim_win_get_cursor(0)[1]
		vim.api.nvim_win_set_cursor(opts.oldWin, { opts.lnumLines[curLine] + 1, 0 })

		vim.api.nvim_win_call(opts.oldWin, function()
			vim.cmd([[normal! zz]])
		end)
	end

    -- add cutom user buffer mappings here
	vim.keymap.set("n", "q", ":q!<cr>", { buffer = buf })
	vim.keymap.set("n", "<Esc>", ":q!<cr>", { buffer = buf })
	vim.keymap.set("n", "t", ":TSBufToggle highlight<cr>", { buffer = buf })
	vim.keymap.set("n", "h", ":TSBufToggle highlight<cr>", { buffer = buf })
	vim.keymap.set("n", "l", function()
		babyComeToMe()
	end, { buffer = buf })
	vim.keymap.set("n", "<CR>", function()
		babyComeToMe()
		vim.api.nvim_win_close(win, true)

		vim.fn.win_gotoid(opts.oldWin)
	end, { buffer = buf })

	local group = vim.api.nvim_create_augroup("Augroup Name", { clear = true })
	vim.api.nvim_create_autocmd("CursorMoved", {
		buffer = buf,
		group = group,
		callback = function()
			babyComeToMe()
		end,
	})
end

local function TongHop(lang)
	local myQuery = [[
;; query
((for_statement) @cap)
((function_call (dot_index_expression) @field (#eq? @field "vim.keymap.set")) @cap)
((function_declaration) @cap)
  ]]

	local opts = {
		textLines = {},
		lnumLines = {},
		oldBuf = vim.api.nvim_get_current_buf(),
		oldWin = vim.api.nvim_get_current_win(),
	}

	local node = ts_utils.get_node_at_cursor()
	local root = ts_utils.get_root_for_node(node)

	local iter_query = vim.treesitter.query.parse_query(lang, myQuery)

	for _, matches, _ in iter_query:iter_matches(root, 0) do
		local row = matches[1]:range()

		local line_text = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]
		table.insert(opts.textLines, string.rep("\t", 2) .. line_text)
		table.insert(opts.lnumLines, row)
	end

	return opts
end

vim.keymap.set("n", "zi", function()
	newWindow("lua", TongHop("lua"))
end, { noremap = true, silent = true })
