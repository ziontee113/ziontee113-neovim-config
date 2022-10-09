local cmp = require("cmp")
local luasnip = require("luasnip")

-- autopairs
require("nvim-autopairs").setup()
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- decorations
local decorations = require("cmp-config.decorations")
local border = decorations.border
local kind_icons = decorations.kind_icons

-- cmp setup
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = {
		["<A-u>"] = cmp.mapping.confirm({ select = true }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		-- 	["<C-i>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		--	["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		completion = {
			border = border,
			scrollbar = "║",
		},
		documentation = {
			border = border,
			scrollbar = "║",
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- kind menu
			vim_item.menu = ({
				luasnip = "[LuaSnip]",
				nvim_lsp = "[LSP]",
				path = "/",
			})[entry.source.name]
			return vim_item
		end,
	},
	-- sources
	sources = {
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "nvim_lsp" },
	},
})

-- keymaps
vim.keymap.set("i", "<C-n>", function()
	if cmp.visible() then
		cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
	else
		vim.cmd("Telescope neoclip")
	end
end)
vim.keymap.set("i", "<C-p>", function()
	if cmp.visible() then
		cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
	else
		vim.cmd("Telescope neoclip")
	end
end)
