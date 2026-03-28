vim.lsp.enable({
	"lua-language-server",
	"ols",
})

vim.lsp.config("lua-language-server", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" } }
		}
	}
})
