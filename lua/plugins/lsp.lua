-- LSP configuration
local function init_lsp()
    -- First, try to require lspconfig safely
    local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
    if not lspconfig_ok then
        print("LSP config not available. Some features will be disabled.")
        return
    end

    -- Ensure compatibility with vim.uv vs vim.loop changes in Neovim 0.10+
    -- This is the core issue causing the 'attempt to index field 'uv'' error
    local has_nightly = vim.fn.has('nvim-0.10.0') == 1
    if has_nightly and not vim.uv then
        vim.uv = vim.loop
    elseif not has_nightly and not vim.loop then
        print("Warning: Neither vim.loop nor vim.uv is available. LSP may not function properly.")
        return
    end

    -- Set up capabilities for LSP
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if cmp_ok then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    -- Define the on_attach function with safe access to client features
    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Set up document highlighting safely
        if client.server_capabilities and client.server_capabilities.documentHighlightProvider then
            local highlight_group = vim.api.nvim_create_augroup("lsp_document_highlight", {
                clear = true
            })
            vim.api.nvim_clear_autocmds({
                group = highlight_group,
                buffer = bufnr
            })

            vim.api.nvim_create_autocmd("CursorHold", {
                callback = function()
                    pcall(vim.lsp.buf.document_highlight)
                end,
                buffer = bufnr,
                group = highlight_group,
                desc = "Document Highlight"
            })

            vim.api.nvim_create_autocmd("CursorMoved", {
                callback = function()
                    pcall(vim.lsp.buf.clear_references)
                end,
                buffer = bufnr,
                group = highlight_group,
                desc = "Clear All References"
            })
        end
    end

    -- Configure diagnostic appearance with safety checks
    pcall(function()
        vim.diagnostic.config({
            virtual_text = {
                prefix = '●'
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "always"
            }
        })

        -- Set diagnostic signs with safety
        local signs = {
            Error = " ",
            Warn = " ",
            Hint = " ",
            Info = " "
        }

        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            pcall(vim.fn.sign_define, hl, {
                text = icon,
                texthl = hl,
                numhl = hl
            })
        end

        -- Customize hover and signature help windows
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded"
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded"
        })
    end)

    -- Set up language servers with safety checks
    local function setup_server(server, config)
        config = config or {}
        config.on_attach = on_attach
        config.capabilities = capabilities

        pcall(function()
            lspconfig[server].setup(config)
        end)
    end

    -- Python
    setup_server("pyright", {
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "basic"
                }
            }
        }
    })

    -- Lua
    setup_server("lua_ls", {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT'
                },
                diagnostics = {
                    globals = {'vim'}
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false
                },
                telemetry = {
                    enable = false
                }
            }
        }
    })

    -- Other language servers
    local simple_servers = {"tsserver", -- JavaScript/TypeScript
    "html", -- HTML
    "cssls", -- CSS
    "clangd", -- C/C++
    "jdtls", -- Java
    "yamlls", -- YAML
    "jsonls", -- JSON
    "dockerls", -- Dockerfile
    "cmake" -- CMake
    }

    for _, server in ipairs(simple_servers) do
        setup_server(server)
    end
end

-- Initialize LSP with error handling
pcall(init_lsp)
