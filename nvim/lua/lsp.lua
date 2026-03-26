vim.lsp.enable({
	"lua_ls",
	"ols",
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" } }
		}
	}
})
vim.lsp.config("ols", { init_options = {} })
