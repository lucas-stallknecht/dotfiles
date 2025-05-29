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
            require('lspconfig').clangd.setup({
                capabilities = {
                    {
                        offsetEncoding = { "utf-8", "utf-16" },
                        textDocument = {
                            semanticHighlightingCapabilities = {
                                semanticHighlighting = true
                            }
                        }
                    }
                }
            })

            vim.diagnostic.config({
                virtual_text = true, -- Enable inline virtual text diagnostics
                signs = true,        -- Show signs in the gutter
                underline = true,    -- Underline errors/warnings in code
                update_in_insert = false,
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    vim.bo[args.buf].formatexpr = nil
                    vim.bo[args.buf].omnifunc = nil

                    -- Delete defaults
                    local keys = {
                        { 'n', 'grr' },
                        { 'n', 'grn' },
                        { 'n', 'gri' },
                        { 'n', 'gO' },
                        { 'n', 'gra' },
                        { 'v', 'gra' },
                        { 'i', '<C-s>' },
                    }

                    for _, key in ipairs(keys) do
                        vim.keymap.del(key[1], key[2])
                    end

                    -- Define buffer-local keymap function
                    local function map(lhs, rhs, desc)
                        vim.keymap.set('n', lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
                    end

                    map('gd', vim.lsp.buf.definition, '[G]o to [d]efinition')
                    map('gD', vim.lsp.buf.declaration, '[G]o to [D]eclaration')
                    map('gr', vim.lsp.buf.references, '[G]o to [R]eferences')
                    map('gi', vim.lsp.buf.implementation, '[G]o to [I]mplementations')
                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ctions')
                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map('<leader>f', vim.lsp.buf.format, '[F]ormat buffer')
                end,
            })
        end
    }
}
