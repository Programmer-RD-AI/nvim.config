require'nvim-treesitter.configs'.setup {
    ensure_installed = {"python", "javascript", "html", "css", "cpp", "java", "markdown", "c", "lua", "vim"},
    highlight = {
        enable = true
    },
    auto_install = true,
    sync_install = false
}
