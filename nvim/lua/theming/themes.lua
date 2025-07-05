local M = {
    themes = {
        rose_pine = {
            style = { "main", "moon", "dawn" },
            transparent = false,
            lualine = function(_)
                return "rose-pine"
            end,
            activate = function(style, transparent)
                require("rose-pine").setup({
                    variant = style,
                    disable_background = transparent,
                })

                vim.cmd.colorscheme("rose-pine")
            end,
        },
    },
}

function M.activate_theme(theme, style, transparent)
    local entry = M.themes[theme]
    entry.activate(style, transparent)

    if transparent then
        vim.opt.cursorline = false
    else
        vim.opt.cursorline = true
    end

    require("lualine").setup({
        options = {
            theme = entry.lualine(style),
        },
    })
end

function M.get_lualine(theme, style)
    return M.themes[theme].lualine(style)
end

return M
