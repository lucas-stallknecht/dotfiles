vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader><tab>', '<cmd>e#<CR>', { desc = 'Open last [Tab]' })

vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- LSP related keymaps
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "[T]ype definition" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "[R]ename Symbol" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat buffer" })

-- K keymap similar to Zed
-- Combined hover + diagnostics
vim.keymap.set("n", "K", function()
	-- Close the popup if opened
	-- local base = vim.api.nvim_get_current_win()
	-- for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
	-- 	local cfg = vim.api.nvim_win_get_config(win)
	-- 	if cfg.relative ~= "" and win ~= base then
	-- 		vim.api.nvim_win_close(win, true)
	-- 		return
	-- 	end
	-- end

	local bufnr = vim.api.nvim_get_current_buf()

	-- Get all active clients for this buffer and use the first one
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	if #clients == 0 then return end
	local client = clients[1]
	local encoding = client.offset_encoding or "utf-16"

	local lsp_params = {
		textDocument = { uri = vim.uri_from_bufnr(bufnr) },
		position = vim.lsp.util.make_position_params(nil, encoding).position,
	}

	client:request("textDocument/hover", lsp_params, function(err, result, _)
		if err or not result or not result.contents then return end

		-- Convert hover to markdown lines
		local hover_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
		-- hover_lines = vim.split(hover_lines, hover_lines, {trimempty = true})

		-- Get diagnostics at the cursor
		local diag_lines = {}
		local diagnostics = vim.diagnostic.get(bufnr, { lnum = vim.fn.line(".") - 1 })
		for _, d in ipairs(diagnostics) do
			table.insert(diag_lines, string.format("⚠ %s [%s]", d.message, d.source or ""))
		end

		-- Combine both
		local lines = {}
		for _, l in ipairs(hover_lines) do table.insert(lines, l) end
		if #diag_lines > 0 then
			table.insert(lines, "")
			vim.list_extend(lines, diag_lines)
		end

		-- Open single floating window
		if #lines > 0 then
			vim.lsp.util.open_floating_preview(lines, "markdown", {
				border = { " ", " ", " ", " ", " ", " ", " ", " " },
				focusable = false,
			})
		end
	end, bufnr)
end)
