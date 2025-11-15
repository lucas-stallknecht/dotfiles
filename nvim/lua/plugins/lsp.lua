return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            require('lspconfig').lua_ls.setup({
            })

            vim.diagnostic.config({
                virtual_text = true, -- Enable inline virtual text diagnostics
                signs = true,        -- Show signs in the gutter
                underline = true,    -- Underline errors/warnings in code
                update_in_insert = false,
            })


            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('my.lsp', {}),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    local function map(lhs, rhs, desc)
                        vim.keymap.set('n', lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
                    end

                    if client:supports_method('textDocument/formatting') then
                        map('<leader>f', vim.lsp.buf.format, '[F]ormat buffer')
                    end
                end,
            })
        end,
    }
}
