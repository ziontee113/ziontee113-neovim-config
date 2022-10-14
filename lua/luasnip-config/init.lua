local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

ls.config.set_config({
	history = true, --keep around last snippet local to jump back
	updateevents = "TextChanged,TextChangedI", --update changes as you type
	enable_autosnippets = true,
})

-- Keymaps
vim.keymap.set({ "i", "s" }, "<a-p>", function()
	if ls.expand_or_jumpable() then
		ls.expand()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<a-k>", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<a-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- special function
vim.keymap.set({ "i", "s" }, "<a-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	else
		-- print current time -- for testing out <a-l>
		local t = os.date("*t")
		local time = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
		print(time)
	end
end)

vim.keymap.set({ "i", "s" }, "<a-h>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)

--Unlink Snippets Command
vim.api.nvim_create_user_command("UnlinkSnippets", function() --{{{
	local session = require("luasnip.session")
	local cur_buf = vim.api.nvim_get_current_buf()

	while true do
		local node = session.current_nodes[cur_buf]
		if not node then
			return
		end
		local user_expanded_snip = node.parent
		-- find 'outer' snippet.
		while user_expanded_snip.parent do
			user_expanded_snip = user_expanded_snip.parent
		end

		user_expanded_snip:remove_from_jumplist()
		-- prefer setting previous/outer insertNode as current node.
		session.current_nodes[cur_buf] = user_expanded_snip.prev.prev or user_expanded_snip.next.next
	end
end, { desc = "Unlink all open snippets" }) --}}}

vim.keymap.set("n", "<C-S-U>", ":UnlinkSnippets<cr>", { silent = true })
