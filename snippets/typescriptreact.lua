---@diagnostic disable: undefined-global

---@diagnostic disable-next-line: unused-local
local snippets, autosnippets, cs = {}, {}, require("luasnip-config.luasnip-utils").create_snippet

-- HTML Elements --

-- Button
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
                <button{}>{}</button>
]=],
		{
			c(1, { i(1, ""), fmt([[ onClick={{{}}}]], { i(1, "") }, { dedent = false }) }),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.tsx" },
	keymaps = { "<C-h><C-b>" },
})

-- Div
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
<div{}>{}</div>
]=],
		{
			i(1, ""),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.tsx" },
	keymaps = { "<C-h><C-d>" },
})

-- Function
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
function {}({}) {{
    {}
}}
]=],
		{
			i(1, ""),
			i(2, ""),
			i(3, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.tsx" },
	keymaps = { "<C-j><C-f>" },
})

-- Functional Component
cs({
	trigger = "rfce",
	nodes = fmt(
		[=[
function {}() {{
  return (
    <>
      {}
    </>
  )
}}

export default {};
]=],
		{
			d(1, function()
				return sn(nil, i(1, vim.fn.expand("%:t:r")))
			end),
			i(2, ""),
			rep(1),
		}
	),
	target_table = snippets,
	pattern = { "*.tsx" },
	keymaps = { "<C-j><C-k>" },
})

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
	keymaps = { "<C-U><C-S>" },
})
