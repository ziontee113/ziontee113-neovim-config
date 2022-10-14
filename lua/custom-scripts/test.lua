local tbl = {
	nums = { 3, 1, 2 },
	strs = { "three", "one", "two" },
}

table.sort(tbl.nums, function(a, b)
	return a < b
end)

vim.pretty_print(tbl)
