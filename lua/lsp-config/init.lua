-- Mason
require("mason").setup()

-- Code Formatting (from null-ls)
local LspFormattingAugroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_formatting = function(bufnr)
	-- vim.lsp.buf.format({
	-- 	filter = function(client)
	-- 		-- apply whatever logic you want (in this example, we'll only use null-ls)
	-- 		return client.name == "null-ls"
	-- 	end,
	-- 	bufnr = bufnr,
	-- })

	vim.lsp.buf.format({
		bufnr = bufnr,
		filter = function(client)
			return client.name == "null-ls" or client.name == "svelte"
		end,
	})

	-- vim.lsp.buf.format({ bufnr = bufnr })
end

-- local diagnostic functions
local function diag_prev()
	local pos = vim.diagnostic.get_prev_pos()
	if pos then
		vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
	end
end

local function diag_next()
	local pos = vim.diagnostic.get_next_pos()
	if pos then
		vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
	end
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<A-j>", diag_next)
vim.keymap.set("n", "<A-k>", diag_prev)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	--vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<a-m>", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, bufopts)

	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<A-,>", vim.lsp.buf.code_action, bufopts)

	vim.keymap.set("x", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("x", "<A-,>", vim.lsp.buf.code_action, bufopts)

	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	-- if you want to set up formatting on save, you can use this as a callback
	-- Code Formatting (from null-ls)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = LspFormattingAugroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = LspFormattingAugroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end

	-- require("lsp-inlayhints").on_attach(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Language Servers
local lspconfig = require("lspconfig")
require("lsp-inlayhints").setup()

-- Rust
local rt = require("rust-tools")

rt.setup({
	tools = {
		inlay_hints = {
			auto = false,
		},
	},
	server = {
		on_attach = on_attach,
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
				},
				completion = {
					postfix = {
						enable = false,
					},
				},
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
})

-- cssls

lspconfig["cssls"].setup({
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
})

-- TypeScript Server
require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		on_attach = on_attach,
		-- settings = {
		-- 	typescript = {
		-- 		inlayHints = {
		-- 			includeInlayParameterNameHints = "all",
		-- 			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
		-- 			includeInlayFunctionParameterTypeHints = true,
		-- 			includeInlayVariableTypeHints = true,
		-- 			includeInlayPropertyDeclarationTypeHints = true,
		-- 			includeInlayFunctionLikeReturnTypeHints = true,
		-- 			includeInlayEnumMemberValueHints = true,
		-- 		},
		-- 	},
		-- 	javascript = {
		-- 		inlayHints = {
		-- 			includeInlayParameterNameHints = "all",
		-- 			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
		-- 			includeInlayFunctionParameterTypeHints = true,
		-- 			includeInlayVariableTypeHints = true,
		-- 			includeInlayPropertyDeclarationTypeHints = true,
		-- 			includeInlayFunctionLikeReturnTypeHints = true,
		-- 			includeInlayEnumMemberValueHints = true,
		-- 		},
		-- 	},
		-- },
	},
})

-- Svelte defaults
lspconfig.svelte.setup({
	on_attach = on_attach,
	capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Tailwind defaults
lspconfig.tailwindcss.setup({})

-- -- Tailwind CSS -- too slow
-- lspconfig.tailwindcss.setup({
-- 	capabilities = capabilities,
-- 	init_options = {
-- 		userLanguages = {
-- 			rust = "rust",
-- 		},
-- 	},
-- 	settings = {
-- 		-- https://github.com/tailwindlabs/tailwindcss-intellisense/tree/6b3e598e5378812b42db8a208db4980c82b60a10/packages/vscode-tailwindcss#tailwindcssincludelanguages
-- 		includeLanguages = {
-- 			rust = "html",
-- 			["*.rs"] = "html",
-- 		},
-- 		tailwindCSS = {
-- 			emmetCompletions = true,
-- 			experimental = {
-- 				classRegex = {
-- 					-- [[class= "([^"]*)]],
-- 					-- [[class: "([^"]*)]],
-- 					-- '~H""".*class="([^"]*)".*"""',
-- 					-- [=["view!\\[\"([^\\]]+)\"\\]"]=],
-- 					-- 'view!\\["([^\\]]+)"\\]',
-- 					[[class="([^"]*)]],
-- 					-- 'class=\\s+"([^"]*)',
-- 				},
-- 			},
-- 			validate = true,
-- 		},
-- 	},
-- 	filetypes = {
-- 		"css",
-- 		"html",
-- 		"rust",
-- 		["*.rs"] = "html",
-- 	},
-- })

-- Emmet

-- lspconfig.emmet_ls.setup({
-- 	on_attach = on_attach,
-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
-- 	init_options = {
-- 		html = {
-- 			options = {
-- 				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
-- 				["bem.enabled"] = true,
-- 			},
-- 		},
-- 	},
-- })

-- Sumneko Lua

lspconfig["sumneko_lua"].setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "describe", "before_each", "after_each", "it" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					"/home/ziontee113/.config/nvim-custom-plugin/zion-kit/",
				},
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- Golang
lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = vim.lsp.protocol.make_client_capabilities(),
})
