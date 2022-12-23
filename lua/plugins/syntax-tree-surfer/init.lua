vim.keymap.set("n", "<Leader><Leader>p", function()
	vim.cmd("STSPrintNodesAtCursor")
end, { noremap = true, silent = true })

vim.keymap.set("n", "vU", function()
	vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vD", function()
	vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

-- Swap Current Node at the Cursor with it's siblings
vim.keymap.set("n", "vu", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vd", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

-- Visual Selection from Normal Mode
vim.keymap.set("n", "vx", "<cmd>STSSelectMasterNode<cr>")
vim.keymap.set("n", "vn", "<cmd>STSSelectCurrentNode<cr>")

-- wild
vim.keymap.set("n", "H", function()
	FEED("vxD")
end)

-- Select Nodes in Visual Mode
vim.keymap.set("x", "J", "<cmd>STSSelectNextSiblingNode<cr>")
vim.keymap.set("x", "K", "<cmd>STSSelectPrevSiblingNode<cr>")
vim.keymap.set("x", "H", "<cmd>STSSelectParentNode<cr>")
vim.keymap.set("x", "L", "<cmd>STSSelectChildNode<cr>")

-- Swapping Nodes in Visual Mode
vim.keymap.set("x", "<C-A-j>", "<cmd>STSSwapNextVisual<cr>")
vim.keymap.set("x", "<C-A-k>", "<cmd>STSSwapPrevVisual<cr>")

-- version 1.1 --
local sts = require("syntax-tree-surfer")

vim.keymap.set(
	"n",
	"<Leader>p",
	'<cmd>lua require("syntax-tree-surfer").go_to_top_node_and_execute_commands(false, { "normal! O", "normal! O", "startinsert" })<cr>'
)

-- V2 Mappings --

-- jump with virtual_text

-- Testing
vim.keymap.set("n", "gke", function() -- only jump to keys
	sts.targeted_jump({ "property_identifier" })
end)
vim.keymap.set("n", "gva", function() -- only jump to keys
	sts.targeted_jump({ "value" })
end)

vim.keymap.set("n", "gvd", function() -- only jump to variable_declarations
	sts.targeted_jump({ "variable_declaration", "variable_declarator" })
end)
vim.keymap.set("n", "gfu", function() -- only jump to functions
	sts.targeted_jump({ "function", "function_definition" })
end)
vim.keymap.set("n", "gco", function() -- only jump to functions
	sts.targeted_jump({ "comment" })
end)
vim.keymap.set("n", "gif", function() -- only jump to if_statements
	sts.targeted_jump({ "if_statement" })
end)
vim.keymap.set("n", "gfo", function() -- only jump to for_statements
	sts.targeted_jump({ "for_statement" })
end)
vim.keymap.set("n", "gj", function() -- jump to all that you specify
	sts.targeted_jump({
		"function",
		"function_definition",
		"if_statement",
		"else_clause",
		"else_statement",
		"elseif_statement",
		"for_statement",
		"while_statement",
		"switch_statement",

		"jsx_opening_element",
		"jsx_self_closing_element",
	})
end)

-------------------------------
-- filtered_jump --
-- "default" means that you jump to the default_desired_types or your lastest jump types
vim.keymap.set("n", "<Down>", function()
	sts.filtered_jump("default", true) --> true means jump forward
end)
vim.keymap.set("n", "<Up>", function()
	sts.filtered_jump("default", false) --> false means jump backwards
end)
vim.keymap.set("n", "<Left>", function()
	sts.filtered_jump({ "variable_declaration" }, false) --> true means jump forward
end)
vim.keymap.set("n", "<Right>", function()
	sts.filtered_jump({ "variable_declaration" }, true) --> true means jump forward
end)

-- Setup Function:

require("syntax-tree-surfer").setup({
	hightlight_group = "STS_highlight",
	disable_no_instance_found_report = false,
	default_desired_types = {
		"function",
		"function_definition",
		"arrow_function",
		"if_statement",
		"else_clause",
		"else_statement",
		"elseif_statement",
		"for_statement",
		"while_statement",
		"switch_statement",

		"jsx_opening_element",
		"jsx_self_closing_element",

		'((dot_index_expression) @cap (#eq? @cap "vim.keymap.set"))',
	},
	left_hand_side = "fdsawervcxqtzb",
	right_hand_side = "jkl;oiu.,mpy/n",
	icon_dictionary = {
		["if_statement"] = "",
		["else_clause"] = "",
		["else_statement"] = "",
		["elseif_statement"] = "",
		["for_statement"] = "ﭜ",
		["while_statement"] = "ﯩ",
		["switch_statement"] = "ﳟ",
		["function"] = "",
		["function_definition"] = "",
		["variable_declaration"] = "",
	},
})

-- {{{nvim-execute-on-save}}}
