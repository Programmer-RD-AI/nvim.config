-- Configure Mason for LSP server management
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
        border = "rounded",
        keymaps = {
            toggle_package_expand = "<CR>",
            install_package = "i",
            update_package = "u",
            check_package_version = "c",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "X",
            cancel_installation = "<C-c>"
        }
    }
})

-- Configure automatic installation of LSP servers
require("mason-lspconfig").setup({
    ensure_installed = { -- Programming Languages
    "pyright", -- Python
    "lua_ls", -- Lua
    "tsserver", -- TypeScript/JavaScript
    "html", -- HTML
    "cssls", -- CSS
    "clangd", -- C/C++
    "jdtls", -- Java
    -- Data & Config Files
    "jsonls", -- JSON
    "yamlls", -- YAML
    "dockerls", -- Dockerfile
    "cmake", -- CMake/Makefile
    -- Additional Languages
    "marksman", -- Markdown
    "sqlls" -- SQL
    },
    automatic_installation = true
})
