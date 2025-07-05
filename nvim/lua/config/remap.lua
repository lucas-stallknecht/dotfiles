-- Open explorer
vim.keymap.set("n", "<leader>x", vim.cmd.Ex, { desc = '[X]plorer' })

-- Clear search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader><tab>', '<cmd>e#<CR>', { desc = 'Open last [Tab]' })

-- Move line
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- /!\ : does not work with french qwerty
vim.keymap.set({ "i" }, "<S-Space>", "_")

vim.api.nvim_set_keymap('n', '<leader>ig', ':lua InsertHeaderGuard()<CR>',
    { noremap = true, silent = true, desc = "[I]nclude Header [G]uard" })

function InsertHeaderGuard()
    local filename = vim.fn.expand("%:t")
    local guard = filename:upper():gsub("[^A-Z0-9]", "_")

    -- Insert lines at top
    vim.api.nvim_buf_set_lines(0, 0, 0, false, {
        "#ifndef " .. guard,
        "#define " .. guard,
        "",
    })

    local n_lines = vim.api.nvim_buf_line_count(0);

    vim.api.nvim_buf_set_lines(0, n_lines+1, n_lines+2, false, {
        "",
        "#endif // " .. guard
    })
end

-- Open theme picker
vim.keymap.set("n", "<leader>ct", "<cmd>lua require'theming.theme_picker'.open_picker()<cr>", { desc = "[C]hange [T]heme"})
