local a = require("plenary.async")

local read_file = function(path)
	local err, fd = a.uv.fs_open(path, "r", 438)
	assert(not err, err)

	local err, stat = a.uv.fs_fstat(fd)
	assert(not err, err)

	local err, data = a.uv.fs_read(fd, stat.size, 0)
	assert(not err, err)

	local err = a.uv.fs_close(fd)
	assert(not err, err)

	return data
end

vim.keymap.set("n", "<C-y>", function()
	a.run(function()
		-- local content = read_file("/home/ziontee113/test/excalidraw/src/components/App.tsx")
		local content = read_file("/home/ziontee113/learn-react/notes-app/pages/index.tsx")

		vim.schedule(function()
			local lang = "tsx"
			local query = [[
((jsx_element) @cap)
            ]]

			local lang_tree = vim.treesitter.get_string_parser(content, lang, { injections = { [lang] = "" } }) -- WARN: we need to learn more about this injections thing
			local root = lang_tree:parse()[1]:root()

			local iter_query = vim.treesitter.query.parse_query(lang, query)
			for _, matches, _ in iter_query:iter_matches(root) do
				local type = matches[1]:type()
				N(type)
			end
		end)
	end)
end, {})

-- {{{nvim-execute-on-save}}}
