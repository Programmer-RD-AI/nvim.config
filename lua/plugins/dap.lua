require('dap').setup({
    adapters = {
        python = {
            type = 'server',
            host = 'localhost',
            port = 5678
        }
    }
})
