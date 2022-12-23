ENTER_CWD = "/home/ziontee113/.config/nvim/"

N = function(message, level, title)
	if type(message) ~= "string" then
		message = vim.inspect(message)
	end
	vim.notify(message, level or "info", { title = title })
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

KS = function(mode, keys, callback)
	for _, key in ipairs(keys) do
		vim.keymap.set(mode, key, function()
			callback()
		end, {})
	end
end

FEED = function(mapping, mode)
	local key = vim.api.nvim_replace_termcodes(mapping, true, false, true)
	vim.api.nvim_feedkeys(key, mode or "m", false)
end

-- {{{nvim-execute-on-save}}}
