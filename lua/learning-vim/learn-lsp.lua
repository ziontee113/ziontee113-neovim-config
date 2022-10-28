local function print_lsp_error(lsp_call)
	print("goto-preview: Error calling LSP" + lsp_call + ". The current language lsp might not support it.")
end

local function test_func()
	local params = vim.lsp.util.make_position_params()
	-- N(params.position)

	local lsp_call = "textDocument/references"
	local success, _ = pcall(vim.lsp.buf_request, 0, lsp_call, params, function(_, results, _, _)
		N(results)
	end)
	if not success then
		print_lsp_error(lsp_call)
	end
end

vim.keymap.set("n", "zi", function()
	test_func()
end, {})

-- {{{nvim-execute-on-save}}}
