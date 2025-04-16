require'nvim-treesitter.configs'.setup {
    -- List of parsers to install - explicitly exclude 'org'
    ensure_installed = {"python", "javascript", "html", "css", "cpp", "java", "markdown", "c", "lua", "vim",
                        "typescript", "json", "yaml", "dockerfile", "make", "csv"},

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Highlighting configuration
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },

    -- Indentation based on treesitter for the = operator
    indent = {
        enable = true
    },

    -- Ignore installation errors for specific parsers
    ignore_install = {"org"}
}

-- Create an autocommand to handle parser installation errors gracefully
vim.api.nvim_create_autocmd("User", {
    pattern = "TSInstallComplete",
    callback = function()
        -- Reset any error messages on successful installations
        vim.cmd("echo ''")
    end
})
