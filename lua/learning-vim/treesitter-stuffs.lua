local function sized_table(value)
	return type(value) == "table" and next(value) ~= nil
end

local function get_query_from_file(lang, query_name)
	local _, query = pcall(vim.treesitter.get_query, lang, query_name)
	if sized_table(query) then
		return query
	end
end

vim.keymap.set("n", " ;", function()
	local query = get_query_from_file("lua", "super_idol")
	N(query)
end, {})

-- {{{nvim-execute-on-save}}}
