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
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders=false",
                    "--fallback-style=llvm",
                    "--enable-config",
                },
                capabilities = {
                    offsetEncoding = { "utf-8" },
                    textDocument = {
                        semanticHighlightingCapabilities = {
                            semanticHighlighting = true
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
                group = vim.api.nvim_create_augroup('my.lsp', {}),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    local function map(lhs, rhs, desc)
                        vim.keymap.set('n', lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
                    end

                    if client:supports_method('textDocument/implementation') then
                        map('gi', vim.lsp.buf.implementation, '[G]o to [I]mplementations')
                    end

                    if client:supports_method('textDocument/definition') then
                        map('gd', vim.lsp.buf.definition, '[G]o to [d]efinition')
                    end

                    if client:supports_method('textDocument/declaration') then
                        map('gD', vim.lsp.buf.declaration, '[G]o to [D]eclaration')
                    end

                    if client:supports_method('textDocument/references') then
                        map('gr', vim.lsp.buf.references, '[G]o to [R]eferences')
                    end

                    if client:supports_method('textDocument/formatting') then
                        map('<leader>f', vim.lsp.buf.format, '[F]ormat buffer')
                    end

                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ctions')
                    map('<leader>r', vim.lsp.buf.rename, '[R]e[n]ame')
                end,
            })
        end,
    }
}
