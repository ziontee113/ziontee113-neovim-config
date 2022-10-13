ENTER_CWD = "/home/ziontee113/.config/nvim/"

N = function(message, level, title)
	vim.notify(vim.inspect(message), level or "info", { title = title })
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end
