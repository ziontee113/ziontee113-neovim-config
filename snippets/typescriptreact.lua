---@diagnostic disable: undefined-global

---@diagnostic disable-next-line: unused-local
local snippets, autosnippets, cs = {}, {}, require("luasnip-config.luasnip-utils").create_snippet

-- React className
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
className={}
]=],
		{
			c(1, { fmt([["{}"]], i(1, "")), fmt([[{{{}}}]], i(1, "")) }),
		}
	),
	target_table = snippets,
	pattern = { "*.tsx" },
	keymaps = { "<C-L>c" },
})

-- console.log Snippet
cs({
	trigger = { hidden = true, trig = "console" },
	nodes = fmt("console.log({})", { i(1, "") }),
	target_table = snippets,
	pattern = { "*.tsx", "*.ts" },
	keymaps = { "<C-L><C-L>" },
})

-- useState Hook
cs({
	trigger = "us",
	nodes = fmt(
		[=[
let [{}, {}] = useState({});
]=],
		{
			i(1, "content"),
			f(function(arg)
				return "set" .. arg[1][1]:gsub("^%l", string.upper)
			end, 1),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.tsx", "*.ts" },
	keymaps = { "<C-L><C-S>" },
})
